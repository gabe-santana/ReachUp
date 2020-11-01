using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAdmin.Models;
using System.Net.Http;

namespace WebAdmin.Repositories
{
    public class CategoryRepository
    {
        private static readonly string BaseURL;
        private static readonly HttpClient client;

        public CategoryRepository()
        {
           this.BaseURL = clsApiConnection.BaseURL;
           this.client = new HttpClient();
        }

        public async Task<List<Communique>> Get(int local)
        {
           string response = await client.GetAsync($"Communique/Get?Local={local}");
           List<Communique> _communiques =
             JsonConvert.DeserializeObject<List<Communique>>(response);
           return _communiques;
        }

        public async Task<bool> Post(Communique communique)
        {
           StringContent body = 
             new StringContent(
                JsonConvert.SerializeObject(communique),
                Encoding.UTF8,
                "application/json"
                );

           bool response = await client.PostAsync($"Communique/Post", body);
           return response;
        }

        public async Task<bool> Patch(Communique communique)
        {
            StringContent body = 
             new StringContent(
                JsonConvert.SerializeObject(communique),
                Encoding.UTF8,
                "application/json"
                );

           bool response = await client.PatchAsync($"Communique/Patch", body);
           return response;
        }

        public async Task<bool> Delete(int id)
        {
           bool response = await client.DeleteAsync($"Communique/Delete?Id={id}");
           return response;
        }
    }
}