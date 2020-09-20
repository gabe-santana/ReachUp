$document.ready(function(){

     let clsLocalRepository = class {
        constructor (){
            const ReachUpWebAPI;
            ReachUpWebAPI = new clsReachUpWebAPI();
         }

         async search(s)
         {
            if (await ReachUpWebAPI.httpGet('Local/Search?s=' + s))
            {
                return ReachUpWebAPI.response;
            }

            else //Ocorreu erro na consulta
            {
                return false;
            }
         }

         async get(l)
         {
             if (await ReachUpWebAPI.httpGet(''))
             {
                 return ReachUpWebAPI.response;
             }

             else
             {
                 return false;
             }
         }
         
         async getAll(s)
         {
            if (await ReachUpWebAPI.httpGet(''))
            {
                return ReachUpWebAPI.response;
            }

            else
            {
                return false;
            }
         }

         async post(l)
         {
            if (await ReachUpWebAPI.httpPost(''))
            {
                return true;
            }

            else
            {
                return false;
            }
         }

         async patch(l)
         {
            if (await ReachUpWebAPI.httpPatch(''))
            {
                return true;
            }

            else
            {
                return false;
            }
         }

         async delete(l)
         {
            if (await ReachUpWebAPI.httpDelete(''))
            {
                return true;
            }

            else
            {
                return false;
            }
         }
    } 

     const LocalRepository;
     LocalRepository = new clsLocalRepository("");

})