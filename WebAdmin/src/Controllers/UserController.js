class UserController {
    api;
    constructor(){
        this.api = new ApiConnection();
    }

    async get(email)
    {
        return await
         this.api.httpAnonymousGet(
             `User?role=loj&email=${email}`
         )
    }

    async getAll()
    {
        return await
         this.api.httpAnonymousGet(
             'User/GetAll?role=loj'
         )
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

    async update(shopkeeper)
    {
        return await
          this.api.httpAnonymousPatch(
              'User/',
              {
                name: shopkeeper.Name,
                email: shopkeeper.Email,
                password: shopkeeper.Password,
                role: 'loj'
              }
          )
    }
}