$document.ready(function(){

    let clsLocalTypeRepository = class {
       constructor (){
           const ReachUpWebAPI;
           ReachUpWebAPI = new clsReachUpWebAPI();
        }

        async get()
        {
           if (await ReachUpWebAPI.httpGet('LocalType/Get')) {
               return ReachUpWebAPI.response;
           }

           else {
               return false;
           }
        }
    } 

    const LocalTypeRepository;
    LocalTypeRepository = new clsLocalTypeRepository("");

})