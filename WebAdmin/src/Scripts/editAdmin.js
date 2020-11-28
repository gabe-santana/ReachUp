$(async () => {

    const clsUser = new UserController();

    getAdmin('adm@email.com'); //pegar do localStorage

    async function getAdmin(email)
    {
        const admin = await clsUser.getAdmin(email);
        $("#txtAdminName").val(admin.name);
    
    }

    async function updateAdmin(email, name, password)
    {
       const admin = new User(name, email, password);
       return await clsUser.updateAdmin(admin);
    }

    $("#btnUpdateAdmin").click(async () => {
        const email = ''; // pegar do localStorage
        const name = $("#txtAdminName");
        const password = $("#txtAdminPassword");

        if (await updateAdmin('adm@email.com', name.val(), password.val()))
        {
            window.history.back();
        }
    })

})