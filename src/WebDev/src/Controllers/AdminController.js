class AdminController {
    api;

    constructor(){
        this.api = new clsApiConnection();
    }

    async getAll()
    {
        return await
         this.api.httpAnonymousGet(`User/GetAll?role=adm`)
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

    async update(Admin)
    {
        return await
         this.api.httpAnonymousPatch(
             `User/`,
             {
                 email: Admin.Email,
                 name:  Admin.Name,
                 password: Admin.Password,
                 role: 'adm'
             }
         )
    }

    async delete(email)
    {
        return await
         this.api.httpAnonymousDelete(`User?Email=${email}`)
    }
}