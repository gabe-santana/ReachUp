$(() => {

    async function recoverPassword(email)
    {
       const clsAccount = new clsAccountController();
       return await clsAccount.recoverPassword(email);
    }

    async function tryUpdatePassword(email, code)
    {
       const clsAccount = new clsAccountController();
       return await clsAccount.tryUpdatePassword(email, code);  
    }

    async function updatePassword(email, password)
    {
       const clsAccount = new clsAccountController();
       return await clsAccount.updatePassword(email, password);
    }

    $('#btnRecoverPassword').click( async () => {

        const email = $('#txtEmail').val();

        if (email != null)
        {
            await recoverPassword(email);
            window.location.href = '../../public/confirmPasswordRecovery.html';
        }
    })

    $('#btnTryUpdatePassword').click( async () => {
        const email = $('#txtEmail').val();
        const cod = $('#txtCode').val();

        if (email != null && cod != null)
        {
            if (await tryUpdatePassword(email, cod))
            {
                $('#txtNewPassword').disabled = false;
                $('#btnUpdatePassword').disabled = false;
            }
        }
    })

    $('#btnUpdatePassword').click( async () => {

        const email = $('#txtEmail').val();
        const password = $('#txtNewPassword').val();

        if (console.log(await updatePassword(email, password)))
        {
           window.location.href = '../../public/index.html';
        }
    })
})