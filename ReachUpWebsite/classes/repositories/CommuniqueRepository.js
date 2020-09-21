$document.ready(function(){

    import { clsReachUpWebAPI } from '..models/ReachUpWebAPI.js';

    export class clsCommuniqueRepository {
        api = new clsReachUpWebAPI();

        async receive(user, local)
        {
           const connectedLocalCommuniques = await this.api.httpGet('Communique/Receive?');
           return connectedLocalCommuniques;
        }

        async get(local_id)
        {
            const localCommuniques = await this.api.httpGet('Communique/Get?id=' + local_id);
            return localCommuniques;
        }

        async post(communique)
        {
            const httpStatus = await this.api.httpPost('Communique/Post');
            return httpStatus;
        }

        async patch(communique)
        {
            const httpStatus = await this.api.httpPatch('Communique/Patch');
            return httpStatus;
        }

        async delete(id)
        {
            const httpStatus = await this.api.httpDelete('Communique/Delete?id=' + id);
            return httpStatus;
        }

    } 

})