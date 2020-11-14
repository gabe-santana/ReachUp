class AdminController {
    api;

    constructor(){
        this.api = new ApiConnection();
    }

    async getAll()
    {
        return await
         this.api.httpAnonymousGet(`User/GetAll?role=loj`)
    }

    async update(Admin)
    {
        return await
         this.api.httpAnonymousPatch(
             `User/`,
             {
                 email: Admin.Email,
                 name:  Admin.Name,
                 password: Admin.Password,
                 role: 'loj'
             }
         )
    }

    async delete(email)
    {
        return await
         this.api.httpAnonymousDelete(`User?Email=${email}`)
    }
}