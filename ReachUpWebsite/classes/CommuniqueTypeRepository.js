$document.ready(function(){

    let clsCommuniqueTypeRepository = class {
       constructor (){
           const ReachUpWebAPI;
           ReachUpWebAPI = new clsReachUpWebAPI();
        }

        async get()
        {
           if (await ReachUpWebAPI.httpGet('FeedbackType/Get')) {
               return ReachUpWebAPI.response;
           }

           else {
               return false;
           }
        }
    } 

    const CommuniqueTypeRepository;
    CommuniqueTypeRepository = new clsCommuniqueTypeRepository("");

})