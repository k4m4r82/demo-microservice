/**
 * Copyright (C) 2018 Kamarudin (http://coding4ever.net/)
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 *
 * The latest version of this file can be found at https://github.com/k4m4r82/demo-ocelot-microservice2
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using BookStore.OrderService.Models;
using BookStore.OrderService.Repository;
using BookStore.Contract;
using MassTransit;
using Microsoft.Extensions.Options;
using BookStore.OrderService.Settings;

namespace BookStore.OrderService.Controllers
{
    public interface IOrderController
    {
        Task<IActionResult> Add(Order order);
        Task<IActionResult> GetAll();
    }

    [Route("api/[controller]")]
    public class OrderController : Controller, IOrderController
    {
        private readonly IBus _bus;
        private readonly IOptions<RabbitMQSettings> _rabbitMQSettings;
        private readonly IOrderRepository _repository;

        public OrderController(IOrderRepository repository, IOptions<RabbitMQSettings> rabbitMQSettings, IBus bus)
        {
            _repository = repository;
            _bus = bus;
            _rabbitMQSettings = rabbitMQSettings;
        }

        [HttpPost, Route("add")]
        public async Task<IActionResult> Add([FromBody]Order order)
        {
            if (ModelState.IsValid)
            {
                var isValidCustomer = await IsValidCustomer((int)order.CustomerId);

                if (isValidCustomer)
                {
                    var result = await _repository.Add(order);
                    return Ok(new { result = result });
                }
                else
                    return BadRequest();
            }
            else
            {
                return BadRequest();
            }
        }

        private async Task<bool> IsValidCustomer(int customerId)
        {
            CustomerResponse customer = null;

            // request data customer ke service customer
            var timeout = TimeSpan.FromSeconds(_rabbitMQSettings.Value.ServiceQueues[0].Timeout);
            var serviceAddress = new Uri($"rabbitmq://{_rabbitMQSettings.Value.Host}/{_rabbitMQSettings.Value.ServiceQueues[0].Name}");

            try
            {
                var client = MassTransitHelper<CustomerRequest, CustomerResponse>.CreateRequestClient(serviceAddress, timeout, _bus);
                customer = await client.Request(new CustomerRequest { Id = customerId });
            }
            catch
            {
            }

            return customer != null;
        }

        [HttpGet, Route("get_all")]
        public async Task<IActionResult> GetAll()
        {
            // ambil informasi order
            var listOfOrder = await _repository.GetAll();

            // ambil informasi customer id berdasarkan data order, untuk keperluan request data ke service customer
            var listOfCustomerId = listOfOrder.Select(f => (int)f.CustomerId)
                                              .Distinct().ToArray();

            // request data ke service customer
            var timeout = TimeSpan.FromSeconds(_rabbitMQSettings.Value.ServiceQueues[1].Timeout);
            var serviceAddress = new Uri($"rabbitmq://{_rabbitMQSettings.Value.Host}/{_rabbitMQSettings.Value.ServiceQueues[1].Name}");

            var client = MassTransitHelper<CustomerRequest, CustomerResponse[]>.CreateRequestClient(serviceAddress, timeout, _bus);
            var listOfCustomer = await client.Request(new CustomerRequest { ArrayOfId = listOfCustomerId });

            // join data order dan customer
            listOfOrder.Join(listOfCustomer, (order) => order.CustomerId, (customer) => customer.Id, (order, customer) =>
            {
                order.CustomerName = customer.Name;
                return order;
            }).ToList();

            return Ok(listOfOrder);
        }

    }

    class MassTransitHelper<TRequest, TResponse>
        where TRequest : class
        where TResponse : class
    {
        public static IRequestClient<TRequest, TResponse> CreateRequestClient(Uri serviceAddress, TimeSpan timeout, IBus bus)
        {
            var client = new MessageRequestClient<TRequest, TResponse>(bus, serviceAddress, timeout, timeout);
            return client;
        }
    }
}