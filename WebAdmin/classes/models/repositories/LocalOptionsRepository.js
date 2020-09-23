$document.ready(function(){

    import { clsReachUpWebAPI } from '..models/ReachUpWebAPI.js';

    export class clsLocalOptionsRepository {
        api = new clsReachUpWebAPI();

        async getLocalTypes()
        {
           const localTypes = await this.api.httpGet('LocalType/Get');
           return localTypes;

        }

        async getFloorOptions()
        {
            //Consultar o map.json ou fazer uma consulta ao banco de dados?
            return;
        }
    } 

})