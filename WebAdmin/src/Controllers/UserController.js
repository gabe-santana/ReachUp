class UserController {
    api;
    constructor(){
        this.api = new ApiConnection();
    }

    async add(shopkeeper, localId)
    {
        return await
         this.api.httpAnonymousPost(
             'User/',
             {
                 name: shopkeeper.Name,
                 email: shopkeeper.Email,
                 password: shopkeeper.Password,
                 role: 'loj',
                 admLocal: {
                     idLocal: localId
                 }
             }
         )

    }
}