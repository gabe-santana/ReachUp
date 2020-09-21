$document.ready(function(){

    let clsUserRepository = class {
       constructor (){
           const ReachUpWebAPI;
           ReachUpWebAPI = new clsReachUpWebAPI();
        }

        async getAllById(id)
        {
           if (await ReachUpWebAPI.httpGet('User/GetAll?id=' + id)) {
               return ReachUpWebAPI.response;
           }

           else {
               return false;
           }
        }

        async getAllByRole(role)
        {
           if (await ReachUpWebAPI.httpGet('User/GetAll?role=' + role)) {
               return ReachUpWebAPI.response;
           }

           else {
               return false;
           }
        }

        async get(role, email)
        {
           if (await ReachUpWebAPI.httpGet('User/Get?role=' + role + '&email=' + email)) {
               return ReachUpWebAPI.response;
           }

           else {
               return false;
           }
        }

        async post(user)
        {
           if (await ReachUpWebAPI.httpPost('User/Post')) {
               return true;
           }

           else {
               return false;
           }
        }

        async patch(user)
        {
           if (await ReachUpWebAPI.httpPatch('User/Patch')) {
               return true;
           }

           else {
               return false;
           }
        }

        async delete(role, email)
        {
           if (await ReachUpWebAPI.httpDelete('User/Delete?role=' + role + '&email=' + email)) {
               return true;
           }

           else {
               return false;
           }
        }

    } 

    const UserRepository;
    UserRepository = new clsUserRepository("");

})