$(() => {

    $('#btnAdicionar').click(async () => {

        const clsAdmin = new AdminController();

        const name = $('#txtName').val();
        const email = $('#txtEmail').val();
        const password = $('#txtPassword').val();

        const admin = new Admin(email, name, password);

        await clsAdmin.add(admin);
    })
})