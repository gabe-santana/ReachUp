$document.ready(function(){

    let clsFeedbackRepository = class {
       constructor (){
           const ReachUpWebAPI;
           ReachUpWebAPI = new clsReachUpWebAPI();
        }

        async getByDate(type, begin, end)
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

        async getByUser(email)
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

        async getByType(type)
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

        async get(id)
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

        async post(feedback)
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

        async patch(feedback)
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

        async delete(id)
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

    const FeedbackRepository;
    FeedbackRepository = new clsFeedbackRepository("");

})