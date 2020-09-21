$document.ready(function(){

    let clsBeaconRepository = class {
       constructor (){
           const ReachUpWebAPI;
           ReachUpWebAPI = new clsReachUpWebAPI();
        }

        async getAll(type)
        {
           if (await ReachUpWebAPI.httpGet('Beacon/GetAll?Type=' + type)) {
               return ReachUpWebAPI.response;
           }

           else {
               return false;
           }
        }

        async get(uuid)
        {
           if (await ReachUpWebAPI.httpGet('Beacon/Get?UUID=' + uuid)) {
               return ReachUpWebAPI.response;
           }

           else {
               return false;
           }
        }

        async post(beacon)
        {
           if (await ReachUpWebAPI.httpPost('Beacon/Post')) {
               return true;
           }

           else {
               return false;
           }
        }

        async patch(beacon)
        {
           if (await ReachUpWebAPI.httpPatch('Beacon/Patch')) {
               return true;
           }

           else {
               return false;
           }
        }

        async delete(uuid)
        {
           if (await ReachUpWebAPI.httpDelete('Beacon/Delete?UUID=' + uuid)) {
               return true;
           }

           else {
               return false;
           }
        }

    } 

    const BeaconRepository;
    BeaconRepository = new clsBeaconRepository("");

})