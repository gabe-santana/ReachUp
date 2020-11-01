using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAdmin.Models;
using System.Net.Http;

namespace WebAdmin.Repositories
{
    public class CommuniqueTypeRepository
    {
        private static readonly string BaseURL;
        private static readonly HttpClient client;

        public CommuniqueTypeRepository()
        {
           this.BaseURL = clsApiConnection.BaseURL;
           this.client = new HttpClient();
        }

        public async Task<List<CommuniqueType>> GetAll()
        {
           string response = await client.GetAsync($"CommuniqueType/GetAll");
           List<CommuniqueType> _communiqueTypes =
             JsonConvert.DeserializeObject<List<CommuniqueType>>(response);
           return _communiqueTypes;
        }

        public async Task<bool> Post()
        {
           string response = await client.PostAsync($"CommuniqueType/Post");
           return response;
        }
    }
}