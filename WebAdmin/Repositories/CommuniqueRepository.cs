using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAdmin.Models;

namespace WebAdmin.Repositories
{
    public class CommuniqueRepository : WebAPI
    {
        public CommuniqueRepository() : base()
        {

        }

        public async Task<List<Communique>> Get(int local)
        {
           string response = await base.Get($"Communique/Get?Local={id}");
           List<Communique> _communiques =
             JsonConvert.DeserializeObject<List<Communique>>(response);
           return _communiques;
        }

        public async Task<Bool> Post(Communique communique)
        {
           string response = await base.Get($"Communique/Post");
           return response;
        }

        public async Task<Bool> Patch(Communique communique)
        {
           string response = await base.Get($"Communique/Patch");
           return response;
        }

        public async Task<Bool> Delete(int id)
        {
           string response = await base.Get($"Communique/Delete?Id={id}");
           return response;
        }
    }
}