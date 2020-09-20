$document.ready(function(){

    let clsBeaconRepository = class {
       constructor (){
           const ReachUpWebAPI;
           ReachUpWebAPI = new clsReachUpWebAPI();
        }

        async getAll(type)
        {
           if (await ReachUpWebAPI.httpGet())
           {
               return ReachUpWebAPI.response;
           }

           else
           {
               return false;
           }
        }

        async get(uuid)
        {
           if (await ReachUpWebAPI.httpGet())
           {
               return ReachUpWebAPI.response;
           }

           else
           {
               return false;
           }
        }

        async post(beacon)
        {
           if (await ReachUpWebAPI.httpPost())
           {
               return true;
           }

           else
           {
               return false;
           }
        }

        async patch(beacon)
        {
           if (await ReachUpWebAPI.httpPatch())
           {
               return true;
           }

           else
           {
               return false;
           }
        }

        async delete(uuid)
        {
           if (await ReachUpWebAPI.httpDelete())
           {
               return true;
           }

           else
           {
               return false;
           }
        }

    } 

    const BeaconRepository;
    BeaconRepository = new clsBeaconRepository("");

})