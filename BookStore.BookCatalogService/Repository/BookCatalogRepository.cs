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

using BookStore.BookCatalogService.Models;

namespace BookStore.BookCatalogService.Repository
{
    public interface IBookCatalogRepository
    {
        Task<List<Book>> GetAll();
        Task<List<Book>> GetByName(string name);        
        Task<List<Book>> GetByCategory(string categoryId);
        Task<Book> GetByIsbn(string isbn);

        Task<int> Add(Book book);
        Task<int> Remove(Book book);
        Task<int> Update(Book book);
    }

    public class BookCatalogRepository : IBookCatalogRepository
    {
        private readonly BookCatalogContext _context;

        public BookCatalogRepository(BookCatalogContext context)
        {
            _context = context;
        }

        public async Task<int> Add(Book book)
        {
            _context.Add(book);            
            return await _context.SaveChangesAsync();
        }

        public async Task<int> Remove(Book book)
        {
            _context.Remove(book);
            return await _context.SaveChangesAsync();
        }

        public async Task<int> Update(Book book)
        {
            _context.Update(book);
            return await _context.SaveChangesAsync();
        }

        public async Task<List<Book>> GetAll()
        {
            return await _context.Book
                                 .Include(f => f.Category)
                                 .Include(f => f.Author)
                                 .ToListAsync(); //Get category as well
        }

        public async Task<List<Book>> GetByCategory(string categoryId)
        {
            return await _context.Book
                                 .Include(f => f.Category)
                                 .Include(f => f.Author)
                                 .Where(f => f.CategoryId == categoryId)
                                 .ToListAsync(); //Get category as well
        }

        public async Task<Book> GetByIsbn(string isbn)
        {
            return await _context.Book
                                 .Include(f => f.Category)
                                 .Include(f => f.Author)
                                 .Where(f => f.Isbn == isbn)
                                 .SingleOrDefaultAsync();
        }

        public async Task<List<Book>> GetByName(string name)
        {
            return await _context.Book
                                 .Include(f => f.Category)
                                 .Include(f => f.Author)
                                 .Where(f => f.Name.ToLower().Contains(name.ToLower()))
                                 .ToListAsync(); //Get category as well
        }        
    }
}
