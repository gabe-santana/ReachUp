$document.ready(function(){

    let clsBeaconTypeRepository = class {
       constructor (){
           const ReachUpWebAPI;
           ReachUpWebAPI = new clsReachUpWebAPI();
        }

        async get()
        {
           if (await ReachUpWebAPI.httpGet('BeaconType/Get')) {
               return ReachUpWebAPI.response;
           }

           else {
               return false;
           }
        }
    } 

    const BeaconTypeRepository;
    BeaconTypeRepository = new clsBeaconTypeRepository("");

})