$document.ready(function(){

    import { clsReachUpWebAPI } from '..models/ReachUpWebAPI.js';
  
    export class clsCommuniqueTypeRepository {
        api = new clsReachUpWebAPI();

        async get()
        {
            const communiqueTypes = await this.api.httpGet('CommuniqueType/Get');
            return communiqueTypes;
        }
    } 
})