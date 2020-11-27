class FeedbackController {
    api;
    constructor(){
        this.api = new ApiConnection();
    }

    async getByDate(type, begin, end)
    {
       return await
         this.api.httpAnonymousGet(`Feedback/ByDate?type=${type}&begin=${begin}&end=${end}`);
    }

    async getByUser(email)
    {
        return await
         this.api.httpAnonymousGet(`Feedback/ByUser?email=${email}`);
    }

    async getAll(type)
    {
        return await
         this.api.httpAnonymousGet(`Feedback/GetAll?type=${type}`);
    }

    async get(id, type)
    {
        return await
         this.api.httpAnonymousGet(`Feedback?id=${id}&type=${type}`);
    }
}