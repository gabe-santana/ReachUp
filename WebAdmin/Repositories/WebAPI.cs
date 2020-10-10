using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace WebAdmin.Repositories
{
    public class WebAPI
    {
        public string BaseURL = "http://192.168.0.109:5000/api";

        public async Task<string> Get(string uri)
        {
            HttpClient cliente = new HttpClient();

            return await cliente.GetStringAsync($"{BaseURL}/{uri}");
        }
    }
}
