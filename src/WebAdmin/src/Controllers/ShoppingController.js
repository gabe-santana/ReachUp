class ShoppingController {
    api;
    constructor(){
        this.api = new ApiConnection();
    }

    async get()
    {
        return await 
          this.api.httpAnonymousGet(`Shopping?id=${0}`);
    }

    async updateOpHours(openingHours)
    {
        return await
         this.api.httpAnonymousPost(
             'Shopping/UpdateOpeningHours',
             {
                id: 0,
                openingHours: {
                   weekDay: openingHours.WeekDay,
                   openingTime: openingHours.OpeningTime,
                   closingTime: openingHours.ClosingTime
                }
             }
        );
    }

    async update(shopping)
    {
        return await
         this.api.httpAnonymousPatch(
            'Shopping/',
            {
               name: shopping.Name,
               message: shopping.Message
            }
         );
    }
}