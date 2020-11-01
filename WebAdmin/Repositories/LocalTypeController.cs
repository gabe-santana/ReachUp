using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAdmin.Models;
using System.Net.Http;

namespace WebAdmin.Repositories
{
    public class LocalTypeRepository
    {
        private static readonly string BaseURL;
        private static readonly HttpClient client;

        public LocalTypeRepository()
        {
           this.BaseURL = clsApiConnection.BaseURL;
           this.client = new HttpClient();
        }

        public async Task<List<LocalType>> GetAll()
        {
           string response = await client.GetAsync($"LocalType/GetAll");
           List<LocalType> _localTypes =
             JsonConvert.DeserializeObject<List<LocalType>>(response);
           return _localTypes;
        }

        public async Task<bool> Post()
        {
           string response = await client.PostAsync($"LocalType/Post");
           return response;
        }
    }
}