using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAdmin.Models;
using System.Net.Http;

namespace WebAdmin.Repositories
{
    public class FeedbackRepository
    {
        private static readonly string BaseURL = clsApiConnection.BaseURL;
        private static readonly HttpClient client = new HttpClient();

        public async Task<List<Feedback>> ByDate(int type, string begin, string end)
        {
           string response = await client.GetAsync($"Feedback/ByDate?Type={type}&Begin={begin}&End={end}");
           List<Feedback> _feedbacks =
             JsonConvert.DeserializeObject<List<Feedback>>(response);
           return _feedbacks;
        }

        public async Task<List<Feedback>> ByUser(string email)
        {
           string response = await client.GetAsync($"Feedback/ByUser?Email={email}");
           List<Feedback> _feedbacks =
             JsonConvert.DeserializeObject<List<Feedback>>(response);
           return _feedbacks;
        }

        public async Task<List<Feedback>> GetAll(int type)
        {
           string response = await client.GetAsync($"Feedback/GetAll?Type={type}");
           List<Feedback> _feedbacks =
             JsonConvert.DeserializeObject<List<Feedback>>(response);
           return _feedbacks;
        }

        public async Task<Feedback> Get(int id)
        {
           string response = await client.GetAsync($"Feedback/Get?Id={id}");
           Feedback _feedback =
             JsonConvert.DeserializeObject<Feedback>(response);
           return _feedback;
        }

        public async Task<bool> Post(Feedback feedback)
        {
           bool response = await client.PostAsync($"Feedback/Post");
           return response;
        }

        public async Task<bool> Patch(Feedback feedback)
        {
           bool response = await client.PatchAsync($"Feedback/Patch");
           return response;
        }

        public async Task<bool> Delete(int id)
        {
           bool response = await client.DeleteAsync($"Feedback/Delete?Id={id}");
           return response;
        }
    }
}