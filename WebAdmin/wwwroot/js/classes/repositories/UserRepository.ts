/// <reference path='../models/ReachUpWebAPI.ts'/>

import { ReachUpWebAPI } from "../models/ReachUpWebAPI";

export module UserRepository {

    export class clsUserRepository extends ReachUpWebAPI.clsReachUpWebAPI {
         constructor(){
             super();
          }

        public async getAllById(id : number)
        {
            const users = await this.httpGet('User/GetAll?id=' + id)
            return users;
        }

        public async getAllByRole(role : string)
        {
           const users = await this.httpGet('User/GetAll?role=' + role);
           return users;
        }

        public async get(role : string, email : string)
        {
           const users = await this.httpGet('User/Get?role=' + role + '&email=' + email);
           return users;
        }

        public async post(user : [])
        {
           const httpStatus = await this.httpPost('User/Post');
           return httpStatus;
        }

        public async patch(user : [])
        {
           const httpStatus = await this.httpPatch('User/Patch');
           return httpStatus;
    
        }

        public async delete(role : string, email : string)
        {
            const httpStatus = await this.httpDelete('User/Delete?role=' + role + '&email=' + email);
            return httpStatus;
        }
    } 
}