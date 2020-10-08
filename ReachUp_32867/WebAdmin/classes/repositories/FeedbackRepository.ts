/// <reference path='../models/ReachUpWebAPI.ts'/>

import { ReachUpWebAPI } from "../models/ReachUpWebAPI";

export module FeedbackRepository {

    export class clsFeedbackRepository extends ReachUpWebAPI.clsReachUpWebAPI {
         constructor(){
            super();
         }

        public async getByDate(type : number, begin : string, end : string)
        {
           const feedbacks = await this.httpGet('Feedback/ByDate?type=' + type + '&begin=' + begin + '&end=' + end);
           return feedbacks;
        }

        public async getByUser(email: string)
        {
           const feedbacks = await this.httpGet('Feedback/ByUser?email=' + email);
           return feedbacks;
        }

        public async getByType(type : number)
        {
           const feedbacks = await this.httpGet('Feedback/GetAll?type=' + type);
           return feedbacks;
        }

        public async get(id : number)
        {
           const feedback = await this.httpGet('Feedback/Get?id=' + id);
           return feedback;
        }

        public async post(feedback : [])
        {
           const httpStatus = await this.httpPost('Feedback/Post');
           return httpStatus;
        }

        public async patch(feedback: [])
        {
           const httpStatus = await this.httpPatch('Feedback/Patch');
           return httpStatus;
        }

        public async delete(id : number)
        {
            const httpStatus = await this.httpDelete('Feedback/Delete?id=' + id);
            return httpStatus;
        }

    } 
}