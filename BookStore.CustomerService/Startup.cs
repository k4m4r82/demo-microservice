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
using BookStore.CustomerService.Repository;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using MassTransit;
using BookStore.Contract;
using BookStore.CustomerService.Consumer;
using BookStore.CustomerService.Settings;
using Microsoft.Extensions.Options;
using Microsoft.Extensions.Logging;

namespace BookStore.CustomerService
{
    public class Startup
    {
        private ILogger _logger;

        public Startup(IConfiguration configuration, ILoggerFactory loggerFactory)
        {
            Configuration = configuration;
            _logger = loggerFactory.CreateLogger<Startup>();
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {            
            services.AddMvc();            

            //Inject
            services.AddDbContext<CustomerContext>(options => {
                var server = Configuration["POSTGRES_HOST"] ?? "127.0.0.1";
                var port = Configuration["POSTGRES_PORT"] ?? "5432";

                var dbName = "BookStore";
                var userName = "postgres";
                var userPassword = "masterkey";

                var connection = $"Server={server};Port={port};User Id={userName};" +
                    $"Password={userPassword};Database={dbName}";

                options.UseNpgsql(connection);
            });

            services.AddScoped<ICustomerRepository, CustomerRepository>();

            services.Configure<RabbitMQSettings>(Configuration.GetSection("RabbitMQSettings"));

            var sp = services.BuildServiceProvider();
            var rabbitMQSettings = sp.GetService<IOptions<RabbitMQSettings>>();            

            var bus = Bus.Factory.CreateUsingRabbitMq(cfg =>
            {
                var rabbitMQUser = Configuration["RABBITMQ_DEFAULT_USER"] ?? "guest";
                var rabbitMQPass = Configuration["RABBITMQ_DEFAULT_PASS"] ?? "guest";

                _logger.LogDebug($"RabbitMQ User: {rabbitMQUser}");
                _logger.LogDebug($"RabbitMQ Pass: {rabbitMQPass}");                

                var host = cfg.Host(new Uri($"rabbitmq://{rabbitMQSettings.Value.Host}/"), h =>
                {
                    h.Username(rabbitMQUser);
                    h.Password(rabbitMQPass);
                });

                var customerRepository = sp.GetService<ICustomerRepository>();

                cfg.ReceiveEndpoint(host, $"{rabbitMQSettings.Value.ServiceQueues[0].Name}", e =>
                {                    
                    e.Consumer(() => new CustomerGetSingleConsumer(customerRepository));
                });

                cfg.ReceiveEndpoint(host, $"{rabbitMQSettings.Value.ServiceQueues[1].Name}", e =>
                {
                    e.Consumer(() => new CustomerGetListConsumer(customerRepository));
                });
            });

            services.AddSingleton<IPublishEndpoint>(bus);
            services.AddSingleton<ISendEndpointProvider>(bus);
            services.AddSingleton<IBus>(bus);

            bus.Start();

            /*
            services.AddSwaggerGen(swagger =>
            {
                swagger.SwaggerDoc("v1", new Info { Title = "Product APIs", Version = "v1" });
            });

            services.AddCors(options =>
            {
                options.AddPolicy("CorsPolicy",
                    builder => builder.AllowAnyOrigin()
                        .AllowAnyMethod()
                        .AllowAnyHeader()
                        .AllowCredentials());
            });*/
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseBrowserLink();
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }

            app.UseStaticFiles();

            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}
