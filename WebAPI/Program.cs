using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace ReachUpWebAPI
{
    public class Program
    {
        public static void Main(string[] args)
        {
            // Begin Changes
            int workerThreads, ioThreads;
            ThreadPool.GetMaxThreads(out workerThreads, out ioThreads);
            ThreadPool.SetMaxThreads(Environment.ProcessorCount, ioThreads);

            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
        Host.CreateDefaultBuilder(args)
          .ConfigureWebHostDefaults(webBuilder =>
          {
              webBuilder.UseStartup<Startup>()
              .UseUrls("http://192.168.0.12:8000/");
          });
    }
}
