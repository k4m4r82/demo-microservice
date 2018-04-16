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

using MassTransit;
using BookStore.Contract;
using BookStore.CustomerService.Repository;

namespace BookStore.CustomerService.Consumer
{
    public class CustomerGetSingleConsumer : IConsumer<CustomerRequest>
    {
        private ICustomerRepository _repository;

        public CustomerGetSingleConsumer(ICustomerRepository repository)
        {
            _repository = repository;
        }

        public async Task Consume(ConsumeContext<CustomerRequest> context)
        {
            var customer = await _repository.GetById(context.Message.Id);

            if (customer != null)
            {
                await context.RespondAsync(new CustomerResponse { Id = customer.Id, Name = customer.Name });
            }
        }
    }
}
