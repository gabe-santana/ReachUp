/// <reference path='../models/ReachUpWebAPI.ts'/>

import { ReachUpWebAPI } from "../models/ReachUpWebAPI";

export module FeedbackRepository {

    export class clsFeedbackTypeRepository extends ReachUpWebAPI.clsReachUpWebAPI {
         constructor(){
             super();
         }

        public async get()
        {
           const feedbackTypes = await this.httpGet('FeedbackType/Get');
           return feedbackTypes;
        }
    } 
}
