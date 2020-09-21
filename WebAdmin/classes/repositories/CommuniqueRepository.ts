/// <reference path='../models/ReachUpWebAPI.ts'/>

import { ReachUpWebAPI } from "../models/ReachUpWebAPI";

export module CommuniqueRepository {

    export class clsCommuniqueRepository extends ReachUpWebAPI.clsReachUpWebAPI {
         constructor(){
             super();
          }

        public async receive(user : string, local : number)
        {
           const connectedLocalCommuniques = await this.httpGet('Communique/Receive?');
           return connectedLocalCommuniques;
        }

        public async get(local_id : number)
        {
            const localCommuniques = await this.httpGet('Communique/Get?id=' + local_id);
            return localCommuniques;
        }

        public async post(communique : [])
        {
            const httpStatus = await this.httpPost('Communique/Post');
            return httpStatus;
        }

        public async patch(communique : [])
        {
            const httpStatus = await this.httpPatch('Communique/Patch');
            return httpStatus;
        }

        public async delete(id: number)
        {
            const httpStatus = await this.httpDelete('Communique/Delete?id=' + id);
            return httpStatus;
        }
    } 
}