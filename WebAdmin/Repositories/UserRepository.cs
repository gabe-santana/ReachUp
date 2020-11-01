using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAdmin.Models;
using System.Net.Http;

namespace WebAdmin.Repositories
{
    public class UserRepository
    {
        private static readonly string BaseURL;
        private static readonly HttpClient client;

        public UserRepository()
        { 
           this.BaseURL = clsApiConnection.BaseURL;
           this.client = new HttpClient();
        }

        public async Task<User> Login(User user) 
        {
            string response = await client.GetAsync($"Account/Login?email={user.Email}&password={user.Password}&role=adm");
          
            User _user =
                JsonConvert.DeserializeObject<User>(response);
         
            return _user;
        }

        public async Task<bool> Add(User user) 
        {
            string response = await client.PostAsync($"User/Post");
            return response;
        }

        public async Task<bool> Patch(User user)
        {
            string response = await client.PatchAsync($"User/Patch");
            return response;
        }

        public async Task<bool> Delete(string email)
        {
            string response = await client.DeleteAsync($"User/Delete?role=adm&email={email}");
        }
    }
}
