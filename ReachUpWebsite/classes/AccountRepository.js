$document.ready(function(){

    let clsAccountRepository = class {
       constructor (){
           const ReachUpWebAPI;
           ReachUpWebAPI = new clsReachUpWebAPI();
        }

        async login(user)
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

        async get(local)
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

        async post(communique)
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

        async patch(communique)
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

    const AccountRepository;
    AccountRepository = new clsAccountRepository("");

})