/// <reference path='../models/ReachUpWebAPI.ts'/>

import { ReachUpWebAPI } from "../models/ReachUpWebAPI";

export module LocalRepository {

    export class clsLocalRepository extends ReachUpWebAPI.clsReachUpWebAPI {
         constructor(){
             super();
          }
         
         public async connect(uuid : string)
         {
            const connectedLocal = await this.httpGet('Local/Connect?uuid=' + uuid);
            return connectedLocal;
         }

         public async search(s : string)
         {
            const locals = await this.httpGet('Local/Search?s=' + s);
            return locals;
         }

         public async get(id : number)
         {
            const local = await this.httpGet('Local/Get?id=' + id);
            return local;
         }
         
         public async getAll(type : number)
         {
            const locals = await this.httpGet('Local/GetAll?type=' + type);
            return locals;
         }

         public async post(local : [])
         {
            const httpStatus = await this.httpPost('Local/Post');
            return httpStatus;
         }

         public async patch(local : [])
         {
            const httpStatus = await this.httpPatch('Local/Patch');
            return httpStatus;
         }

         public async delete(id : number)
         {
            const httpStatus = await this.httpDelete('Local/Delete?id=' + id);
            return httpStatus;
         }
    }
} 