$(async () => {

    const clsAdmin = new AdminController();

    const admins = await clsAdmin.getAll();

    admins.forEach(admin => {
        
    })


    $('.btnDeleteAdmin').click(async () => {

        const email = $('.divAdmin').val();

        await clsAdmin.delete(email);
    })
})