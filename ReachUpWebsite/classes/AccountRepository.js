$document.ready(function(){

    //import { clsReachUpWebAPI } from "./ReachUpWebAPI";
      import 'ReachUpWebAPI';

    let clsAccountRepository = class {
       constructor (){
           const ReachUpWebAPI;
           ReachUpWebAPI = new clsReachUpWebAPI();
        }

        async login(email, password)
        {
           if (await ReachUpWebAPI.httpGet('Account/Login?Email=' + email + '&Password=' + password + '&role=adm')) {
               return ReachUpWebAPI.response;
           }

           else {
               return false;
           }
        }
        
    } 

    const AccountRepository;
    AccountRepository = new clsAccountRepository("");

})