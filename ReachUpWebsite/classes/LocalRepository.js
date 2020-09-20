$document.ready(function(){

     let clsLocalRepository = class {
        constructor (){
            const ReachUpWebAPI;
            ReachUpWebAPI = new clsReachUpWebAPI();
         }

         async connect(uuid)
         {
            if (await ReachUpWebAPI.httpGet('Local/Connect?uuid=' + uuid)) {
                return ReachUpWebAPI.response;
            }

            else {
                return false;
            }
         }

         async search(s)
         {
            if (await ReachUpWebAPI.httpGet('Local/Search?s=' + s)) {
                return ReachUpWebAPI.response;
            }

            else {
                return false;
            }
         }

         async get(id)
         {
             if (await ReachUpWebAPI.httpGet('Local/Get?id=' + id)) {
                 return ReachUpWebAPI.response;
             }

             else {
                 return false;
             }
         }
         
         async getAll(type)
         {
            if (await ReachUpWebAPI.httpGet('Local/GetAll?type=' + type)) {
                return ReachUpWebAPI.response;
            }

            else {
                return false;
            }
         }

         async post(local)
         {
            if (await ReachUpWebAPI.httpPost('Local/Post')) {
                return true;
            }

            else {
                return false;
            }
         }

         async patch(local)
         {
            if (await ReachUpWebAPI.httpPatch('Local/Patch')) {
                return true;
            }

            else {
                return false;
            }
         }

         async delete(id)
         {
            if (await ReachUpWebAPI.httpDelete('Local/Delete?id=' + id)) {
                return true;
            }

            else {
                return false;
            }
         }
    } 

     const LocalRepository;
     LocalRepository = new clsLocalRepository("");

})