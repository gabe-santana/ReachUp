$document.ready(function(){

    let clsFeedbackTypeRepository = class {
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

    const FeedbackTypeRepository;
    FeedbackTypeRepository = new clsFeedbackTypeRepository("");

})