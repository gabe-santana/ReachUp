/// <reference path='../models/ReachUpWebAPI.ts'/>

import { ReachUpWebAPI } from "../models/ReachUpWebAPI";

export module LocalOptionsRepository {

    export class clsLocalOptionsRepository extends ReachUpWebAPI.clsReachUpWebAPI {
         constructor(){
             super();
         }

        public async getLocalTypes()
        {
           const localTypes = await this.httpGet('LocalType/Get');
           return localTypes;

        }

        public async getFloorOptions()
        {
            //Consultar o map.json ou fazer uma consulta ao banco de dados?
            return;
        }
    }
} 