using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAdmin.Models;

namespace WebAdmin.Repositories
{
    /*public class CommuniqueRepository : WebAPI
    {
        public CommuniqueRepository() : base()
        {

        }

        public async Task<List<Communique>> Get(int local)
        {
           string response = await base.Get($"Communique/Get?Local={local}");
           List<Communique> _communiques =
             JsonConvert.DeserializeObject<List<Communique>>(response);
           return _communiques;
        }

        public async Task<bool> Post(Communique communique)
        {
           bool response = await base.Post($"Communique/Post");
           return response;
        }

        public async Task<bool> Patch(Communique communique)
        {
           bool response = await base.Patch($"Communique/Patch");
           return response;
        }

        public async Task<bool> Delete(int id)
        {
           bool response = await base.Delete($"Communique/Delete?Id={id}");
           return response;
        }
    }*/
}