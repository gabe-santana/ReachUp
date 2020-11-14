class AdminController {
    api;

    constructor(){
        this.api = new clsApiConnection();
    }

    async add(Admin)
    {
        return await
         this.api.httpAnonymousPost(
             `User/`,
             {
                email: Admin.Email,
                name: Admin.Name,
                password: Admin.Password,
                role: 'adm'
             }
         )
    }
}