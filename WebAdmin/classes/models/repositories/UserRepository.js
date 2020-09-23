$document.ready(function(){

    import { clsReachUpWebAPI } from '..models/ReachUpWebAPI.js';

    export class clsUserRepository {
        api = new clsReachUpWebAPI();

        async getAllById(id)
        {
            const users = await this.api.httpGet('User/GetAll?id=' + id)
            return users;
        }

        async getAllByRole(role)
        {
           const users = await this.api.httpGet('User/GetAll?role=' + role);
           return users;
        }

        async get(role, email)
        {
           const users = await this.api.httpGet('User/Get?role=' + role + '&email=' + email);
           return users;
        }

        async post(user)
        {
           const httpStatus = await this.api.httpPost('User/Post');
           return httpStatus;
        }

        async patch(user)
        {
           const httpStatus = await this.api.httpPatch('User/Patch');
           return httpStatus;
    
        }

        async delete(role, email)
        {
            const httpStatus = await this.api.httpDelete('User/Delete?role=' + role + '&email=' + email);
            return httpStatus;
        }

    } 

})