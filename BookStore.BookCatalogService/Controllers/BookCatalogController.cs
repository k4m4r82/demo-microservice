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

using BookStore.BookCatalogService.Models;
using BookStore.BookCatalogService.Repository;
using AutoMapper;

namespace BookStore.BookCatalogService.Controllers
{
    public interface IBookCatalogController
    {
        Task<IActionResult> Add(Book book);
        Task<IActionResult> Remove(Book book);
        Task<IActionResult> Update(Book book);

        Task<IActionResult> GetAll();
        Task<IActionResult> GetByName(string name);        
        Task<IActionResult> GetByCategory(string categoryId);
        Task<IActionResult> GetByIsbn(string isbn);
    }

    [Route("api/[controller]")]
    public class BookCatalogController : Controller, IBookCatalogController
    {
        private readonly IBookCatalogRepository _repository;
        private readonly IMapper _mapper;

        public BookCatalogController(IMapper mapper, IBookCatalogRepository repository)
        {
            _repository = repository;
            _mapper = mapper;
        }

        [HttpPost, Route("add")]
        public async Task<IActionResult> Add([FromBody]Book book)
        {
            if (ModelState.IsValid)
            {
                var result = await _repository.Add(book);
                return Ok(new { result = result });
            }
            else
            {
                return BadRequest();
            }
        }

        [HttpPost, Route("remove")]
        public async Task<IActionResult> Remove(Book book)
        {
            if (ModelState.IsValid)
            {
                var result = await _repository.Remove(book);
                return Ok(new { result = result });
            }
            else
            {
                return BadRequest();
            }
        }

        [HttpPost, Route("update")]
        public async Task<IActionResult> Update(Book book)
        {
            if (ModelState.IsValid)
            {
                var result = await _repository.Update(book);
                return Ok(new { result = result });
            }
            else
            {
                return BadRequest();
            }
        }

        [HttpGet, Route("get_all")]
        public async Task<IActionResult> GetAll()
        {
            var oList = await _repository.GetAll();

            var results = _mapper.Map<List<BookCatalogViewModel>>(oList);

            return Ok(results);
        }

        [HttpGet, Route("get_by_category")]
        public async Task<IActionResult> GetByCategory(string categoryId)
        {
            var oList = await _repository.GetByCategory(categoryId);

            var results = _mapper.Map<List<BookCatalogViewModel>>(oList);

            return Ok(results);
        }

        [HttpGet, Route("get_by_isbn")]
        public async Task<IActionResult> GetByIsbn(string isbn)
        {
            var obj = await _repository.GetByIsbn(isbn);

            var result = _mapper.Map<BookCatalogViewModel>(obj);

            return Ok(result);
        }

        [HttpGet, Route("get_by_name")]
        public async Task<IActionResult> GetByName(string name)
        {
            var oList = await _repository.GetByName(name);

            var results = _mapper.Map<List<BookCatalogViewModel>>(oList);

            return Ok(results);
        }        
    }
}