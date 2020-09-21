/// <reference path='../models/ReachUpWebAPI.ts'/>

import { ReachUpWebAPI } from "../models/ReachUpWebAPI";

    export class clsMapRepository extends ReachUpWebAPI.clsReachUpWebAPI {
         constructor(){
             super();
         }

         async getJson() {
            const contentRootPath = _hostingEnvironment.ContentRootPath;
            const JSON = System.IO.File.ReadAllText(contentRootPath + '/App_Data/json/map/map.json');
            return JSON;
        } // Importante: verificar compatibilidade deste código, herdado do repository/controller da API
    } 
