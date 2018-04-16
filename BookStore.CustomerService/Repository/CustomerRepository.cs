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
using Microsoft.EntityFrameworkCore;

using BookStore.CustomerService.Models;

namespace BookStore.CustomerService.Repository
{
    public interface ICustomerRepository
    {
        Task<Customer> GetById(int id);
        Task<List<Customer>> GetByListId(int[] id);
        Task<List<Customer>> GetAll();
        Task<List<Customer>> GetByName(string name);
    }

    public class CustomerRepository : ICustomerRepository
    {
        private readonly CustomerContext _context;

        public CustomerRepository(CustomerContext context)
        {
            _context = context;
        }

        public async Task<Customer> GetById(int id)
        {
            return await _context.Customer
                                 .FirstOrDefaultAsync(f => f.Id == id);
        }

        public async Task<List<Customer>> GetAll()
        {
            return await _context.Customer
                                 .ToListAsync(); //Get category as well
        }

        public async Task<List<Customer>> GetByListId(int[] id)
        {
            return await _context.Customer
                                 .Where(f => id.Contains(f.Id))
                                 .ToListAsync(); //Get category as well
        }

        public async Task<List<Customer>> GetByName(string name)
        {
            return await _context.Customer
                                 .Where(f => f.Name.ToLower().Contains(name.ToLower()))
                                 .ToListAsync(); //Get category as well
        }        
    }
}
