using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAdmin.Models;

namespace WebAdmin.Repositories
{
    public class BeaconRepository : WebAPI
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

        public async Task<Beacon> Get(string uuid)
        {
           string response = await base.Get($"Beacon/Get?UUID={uuid}");
           Beacon _beacon =
             JsonConvert.DeserializeObject<Beacon>(response);
           return _beacon;
        }

        public async Task<List<Beacon>> GetAll(int type)
        {
           string response = await base.Get($"Beacon/GetAll?Type={type}");
           List<Beacon> _beacons =
             JsonConvert.DeserializeObject<List<Beacon>>(response);
           return _beacons;
        }

        public async Task<Bool> Post(Beacon beacon)
        {
           string response = await base.Get($"Beacon/Post");
           return response;
        }

        public async Task<Bool> Patch(Beacon beacon)
        {
           string response = await base.Get($"Beacon/Patch");
           return response;
        }

        public async Task<Bool> Delete(string uuid)
        {
           string response = await base.Get($"Beacon/Delete?UUID={uuid}");
           return response;
        }
    }
}