using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAdmin.Models;

namespace WebAdmin.Repositories
{
    /*public class BeaconRepository : WebAPI
    {
        public BeaconRepository() : base()
        {

        }

        public async Task<List<Beacon>> GetAll(int type)
        {
           string response = await base.Get($"Beacon/GetAll?Type={type}");
           List<Beacon> _beacons =
             JsonConvert.DeserializeObject<List<Beacon>>(response);
           return _beacons;
        }

        public async Task<Beacon> Fetch(string uuid)
        {
           string response = await base.Get($"Beacon/Get?UUID={uuid}");
           Beacon _beacon =
             JsonConvert.DeserializeObject<Beacon>(response);
           return _beacon;
        }

        public async Task<bool> Post(Beacon beacon)
        {
           bool response = await base.Post($"Beacon/Post");
           return response;
        }

        public async Task<bool> Patch(Beacon beacon)
        {
           bool response = await base.Patch($"Beacon/Patch");
           return response;
        }

        public async Task<bool> Delete(string uuid)
        {
           bool response = await base.Delete($"Beacon/Delete?UUID={uuid}");
           return response;
        }
    }*/
}