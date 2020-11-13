class FeedbackController {
    api;
    constructor(){
        this.api = new clsApiConnection();
    }

    async getByDate(type, begin, end)
    {
       return await
         this.api.httpGet(`Feedback/ByDate?type=${type}&begin=${begin}&end=${end}`);
    }

    async getByUser(email)
    {
        return await
         this.api.httpGet(`Feedback/ByUser?email=${email}`);
    }

    async getAll(type)
    {
        return await
         this.api.httpGet(`Feedback/GetAll?type=${type}`);
    }

    async get(id, type)
    {
        return await
         this.api.httpGet(`Feedback?id=${id}&type=${type}`);
    }
}