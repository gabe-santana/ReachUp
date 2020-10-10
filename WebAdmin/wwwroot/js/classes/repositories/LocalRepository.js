$document.ready(function(){

    import { clsReachUpWebAPI } from '..models/ReachUpWebAPI.js';

     export class clsLocalRepository {
         api = new clsReachUpWebAPI();
         
         async connect(uuid)
         {
            const connectedLocal = await this.api.httpGet('Local/Connect?uuid=' + uuid);
            return connectedLocal;
         }

         async search(s)
         {
            const locals = await this.api.httpGet('Local/Search?s=' + s);
            return locals;
         }

         async get(id)
         {
            const local = await this.api.httpGet('Local/Get?id=' + id);
            return local;
         }
         
         async getAll(type)
         {
            const locals = await this.api.httpGet('Local/GetAll?type=' + type);
            return locals;
         }

         async post(local)
         {
            const httpStatus = await this.api.httpPost('Local/Post');
            return httpStatus;
         }

         async patch(local)
         {
            const httpStatus = await this.api.httpPatch('Local/Patch');
            return httpStatus;
         }

         async delete(id)
         {
            const httpStatus = await this.api.httpDelete('Local/Delete?id=' + id);
            return httpStatus;
         }
    } 

})