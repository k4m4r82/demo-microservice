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

using BookStore.CustomerService.Models;
using BookStore.CustomerService.Repository;

namespace BookStore.CustomerService.Controllers
{
    public interface ICustomerController
    {
        Task<IActionResult> GetById(int id);
        Task<IActionResult> GetAll();
        Task<IActionResult> GetByName(string name);
    }

    [Route("api/[controller]")]
    public class CustomerController : Controller, ICustomerController
    {
        private readonly ICustomerRepository _repository;

        public CustomerController(ICustomerRepository repository)
        {
            _repository = repository;
        }

        [HttpGet, Route("get_all")]
        public async Task<IActionResult> GetAll()
        {
            var oList = await _repository.GetAll();

            return Ok(oList);
        }

        [HttpGet, Route("get_by_id")]
        public async Task<IActionResult> GetById(int id)
        {
            var obj = await _repository.GetById(id);

            return Ok(obj);
        }

        [HttpGet, Route("get_by_name")]
        public async Task<IActionResult> GetByName(string name)
        {
            var oList = await _repository.GetByName(name);

            return Ok(oList);
        }
    }
}