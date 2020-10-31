using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAdmin.Models;

namespace WebAdmin.Repositories
{
    /*public class LocalRepository : WebAPI
    {
        public LocalRepository() : base()
        {

        }

        public async Task<Local> Get(int id)
        {
           string response = await base.Get($"Local/Get?Id={id}");
           Local _local =
            JsonConvert.DeserializeObject<Local>(response);
         
           return _local;
        }

        public async Task<List<Local>> GetAll(string typeName)
        {
           string response = await base.Get($"Local/GetAll?Type={typeName}");
           List<Local> _locals =
             JsonConvert.DeserializeObject<List<Local>>(response);

           return _locals;
        }

        public async Task<bool> Post(Local local)
        {
           bool response = await base.Post($"Local/Post");
           return response;
        }

        public async Task<bool> Patch(Local local)
        {
           bool response = await base.Patch($"Local/Patch");
           return response;
        }

        public async Task<bool> Delete(int id)
        {
           bool response = await base.Delete($"Local/Delete?Id={id}");
           return response;
        }

        public async Task<bool> AddOpHours(Local local, OpeningHours OpeningHours)
        {
           bool response = await base.Post($"Local/AddOpHours");
           return response;
        }

        public async Task<List<string>> FetchOpHours(int localId, int weekDay)
        {
           string response = await base.Get($"Local/FetchOpHours?localId={localId}&weekDay={weekDay}");
           List<string> _times =
             JsonConvert.DeserializeObject<List<string>>(response);

           return _times;
        }
    }*/
}