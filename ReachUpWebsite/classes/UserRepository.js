$document.ready(function(){

    let clsUserRepository = class {
       constructor (){
           const ReachUpWebAPI;
           ReachUpWebAPI = new clsReachUpWebAPI();
        }

        async getAll(id)
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

        async getAll(role)
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

        async get(role, email)
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

        async post(user)
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

        async patch(user)
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

        async delete(role, email)
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

    const UserRepository;
    UserRepository = new clsUserRepository("");

})