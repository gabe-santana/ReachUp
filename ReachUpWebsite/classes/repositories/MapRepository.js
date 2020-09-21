$document.ready(function(){

    import { clsReachUpWebAPI } from '..models/ReachUpWebAPI.js';

    export class clsMapRepository {
        api = new clsReachUpWebAPI();

        async getJson() {
            const contentRootPath = _hostingEnvironment.ContentRootPath;
            const JSON = System.IO.File.ReadAllText(contentRootPath + '/App_Data/json/map/map.json');
            return JSON;
        } // Importante: verificar compatibilidade deste código, herdado do repository/controller da API
    } 
})