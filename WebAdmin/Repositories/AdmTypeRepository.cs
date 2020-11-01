using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAdmin.Models;
using System.Net.Http;

namespace WebAdmin.Repositories
{
    public class AdmTypeRepository
    {
        private static readonly string BaseURL;
        private static readonly HttpClient client;

        public AdmTypeRepository()
        {
           this.BaseURL = clsApiConnection.BaseURL;
           this.client = new HttpClient();
        }

        public async Task<object> GetAll()
        {
           string response = await client.GetAsync($"AdmType/GetAll");
           List<AdmType> _admTypes =
             JsonConvert.DeserializeObject<List<AdmType>>(response);
           return _admTypes;
        }

        public async Task<bool> Post()
        {
           string response = await client.PostAsync($"AdmType/Post");
           return response;
        }
    }
}