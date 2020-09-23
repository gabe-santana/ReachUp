$document.ready(function(){

    import { clsReachUpWebAPI } from '..models/ReachUpWebAPI.js';

    export class clsAccountRepository {
         api = new clsReachUpWebAPI();
        
         async login(email, password)
         {
            const nm_user = await this.api.httpGet('Account/Login?Email=' + email + '&Password=' + password + '&role=adm');
            return nm_user;
         } 
    }
})