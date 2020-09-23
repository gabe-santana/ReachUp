$document.ready(function(){

    import { clsReachUpWebAPI } from '..models/ReachUpWebAPI.js';

    export class clsFeedbackTypeRepository {
        api = new clsReachUpWebAPI();

        async get()
        {
           const feedbackTypes = await this.api.httpGet('FeedbackType/Get');
           return feedbackTypes;
        }
    } 

})