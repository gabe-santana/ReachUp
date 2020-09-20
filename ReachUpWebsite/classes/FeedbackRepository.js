$document.ready(function(){

    let clsFeedbackRepository = class {
       constructor (){
           const ReachUpWebAPI;
           ReachUpWebAPI = new clsReachUpWebAPI();
        }

        async getByDate(type, begin, end)
        {
           if (await ReachUpWebAPI.httpGet('Feedback/ByDate?type=' + type + '&begin=' + begin + '&end=' + end)) {
               return ReachUpWebAPI.response;
           }

           else {
               return false;
           }
        }

        async getByUser(email)
        {
           if (await ReachUpWebAPI.httpGet('Feedback/ByUser?email=' + email)) {
               return ReachUpWebAPI.response;
           }

           else {
               return false;
           }
        }

        async getByType(type)
        {
           if (await ReachUpWebAPI.httpGet('Feedback/GetAll?type=' + type)) {
               return ReachUpWebAPI.response;
           }

           else {
               return false;
           }
        }

        async get(id)
        {
           if (await ReachUpWebAPI.httpGet('Feedback/Get?id=' + id)) {
               return ReachUpWebAPI.response;
           }

           else {
               return false;
           }
        }

        async post(feedback)
        {
           if (await ReachUpWebAPI.httpPost('Feedback/Post')) {
               return true;
           }

           else {
               return false;
           }
        }

        async patch(feedback)
        {
           if (await ReachUpWebAPI.httpPatch('Feedback/Patch')) {
               return true;
           }

           else {
               return false;
           }
        }

        async delete(id)
        {
           if (await ReachUpWebAPI.httpDelete('Feedback/Delete?id=' + id)) {
               return true;
           }

           else {
               return false;
           }
        }

    } 

    const FeedbackRepository;
    FeedbackRepository = new clsFeedbackRepository("");

})