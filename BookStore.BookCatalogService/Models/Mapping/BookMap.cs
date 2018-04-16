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

using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace BookStore.BookCatalogService.Models.Mapping
{
    public class BookMap : IEntityTypeConfiguration<Book>
    {        
        public void Configure(EntityTypeBuilder<Book> entity)
        {
            entity.ToTable("book");

            entity.Property(e => e.Id)
                .HasColumnName("id")
                .ValueGeneratedNever();

            entity.Property(e => e.AuthorId).HasColumnName("author_id");

            entity.Property(e => e.CategoryId).HasColumnName("category_id");

            entity.Property(e => e.Description).HasColumnName("description");

            entity.Property(e => e.Isbn).HasColumnName("isbn");

            entity.Property(e => e.Name).HasColumnName("name");

            entity.Property(e => e.Price).HasColumnName("price");

            entity.Property(e => e.PublishedDate).HasColumnName("published_date");

            entity.Property(e => e.Stock).HasColumnName("stock");

            entity.HasOne(d => d.Author)
                .WithMany(p => p.Book)
                .HasForeignKey(d => d.AuthorId)
                .HasConstraintName("book_fk");

            entity.HasOne(d => d.Category)
                .WithMany(p => p.Book)
                .HasForeignKey(d => d.CategoryId)
                .HasConstraintName("book_fk1");
        }
    }
}
