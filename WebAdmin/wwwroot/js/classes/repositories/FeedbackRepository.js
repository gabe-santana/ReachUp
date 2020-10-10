$document.ready(function(){

    import { clsReachUpWebAPI } from '..models/ReachUpWebAPI.js';

    export class clsFeedbackRepository {
         api = new clsReachUpWebAPI();

        async getByDate(type, begin, end)
        {
           const feedbacks = await this.api.httpGet('Feedback/ByDate?type=' + type + '&begin=' + begin + '&end=' + end);
           return feedbacks;
        }

        async getByUser(email)
        {
           const feedbacks = await this.api.httpGet('Feedback/ByUser?email=' + email);
           return feedbacks;
        }

        async getByType(type)
        {
           const feedbacks = await this.api.httpGet('Feedback/GetAll?type=' + type);
           return feedbacks;
        }

        async get(id)
        {
           const feedback = await this.api.httpGet('Feedback/Get?id=' + id);
           return feedback;
        }

        async post(feedback)
        {
           const httpStatus = await this.api.httpPost('Feedback/Post');
           return httpStatus;
        }

        async patch(feedback)
        {
           const httpStatus = await this.api.httpPatch('Feedback/Patch');
           return httpStatus;
        }

        async delete(id)
        {
            const httpStatus = await this.api.httpDelete('Feedback/Delete?id=' + id);
            return httpStatus;
        }

    } 

})