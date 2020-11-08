using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAdmin.Models;
using System.Net.Http;
using System.IO;

namespace WebAdmin.Repositories
{
    public class LocalRepository
    {
        private static readonly string BaseURL = clsApiConnection.BaseURL;
        private static readonly HttpClient client = new HttpClient();

        public async Task<Local> Get(int id)
        {
           string response = await client.GetAsync($"Local/Get?Id={id}");
           Local _local =
            JsonConvert.DeserializeObject<Local>(response);
         
           return _local;
        }

        public async Task<List<Local>> GetAll(string typeName)
        {
           string response = await client.GetAsync($"Local/GetAll?Type={typeName}");
           List<Local> _locals =
             JsonConvert.DeserializeObject<List<Local>>(response);

           return _locals;
        }

        public async Task<bool> Post(Local local)
        {
           bool response = await client.PostAsync($"Local/Post");
           return response;
        }

        public async Task<bool> Patch(Local local)
        {
           bool response = await client.PatchAsync($"Local/Patch");
           return response;
        }

        public async Task<bool> Delete(int id)
        {
           bool response = await client.DeleteAsync($"Local/Delete?Id={id}");
           return response;
        }

        public async Task<bool> AddOpHours(Local local, OpeningHours OpeningHours)
        {
           bool response = await client.PostAsync($"Local/AddOpHours");
           return response;
        }

        public async Task<List<string>> FetchOpHours(int localId, int weekDay)
        {
           string response = await client.GetAsync($"Local/FetchOpHours?localId={localId}&weekDay={weekDay}");
           List<string> _times =
             JsonConvert.DeserializeObject<List<string>>(response);

           return _times;
        }

        /*public async Task<File> GetImage(int id)
        {
            
        }*/

        public async Task<string> UploadImage()
        {

        }
    }
}