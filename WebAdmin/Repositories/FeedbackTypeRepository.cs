using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAdmin.Models;
using System.Net.Http;

namespace WebAdmin.Repositories
{
    public class FeedbackTypeRepository
    {
        private static readonly string BaseURL;
        private static readonly HttpClient client;

        public FeedbackTypeRepository()
        {
           this.BaseURL = clsApiConnection.BaseURL;
           this.client = new HttpClient();
        }

        public async Task<List<FeedbackType>> GetAll()
        {
           string response = await client.GetAsync($"FeedbackType/GetAll");
           List<FeedbackType> _feedbackTypes =
             JsonConvert.DeserializeObject<List<FeedbackType>>(response);
           return _feedbackTypes;
        }

        public async Task<bool> Post()
        {
           string response = await client.PostAsync($"FeedbackType/Post");
           return response;
        }
    }
}