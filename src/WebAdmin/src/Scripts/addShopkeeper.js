$( () => {

    const clsUser = new UserController();

    async function addShopkeeper(email, name, password, localId)
    {
       const shopkeeper = new User(name, email, password);
       return await clsUser.add(shopkeeper, localId);
    }

    $("#btnAddShopkeeper").click(async () => {
        const email = $("#txtShopkeeperEmail");
        const name = $("#txtShopkeeperName");
        const password = $("#txtShopkeeperPassword");
        const localId = $("#cmbStores");

        if (await addShopkeeper(email.val(), name.val(), password.val(), localId.val()))
        {
            email.val("");
            name.val("");
            password.val("");
            //localId.val(0);
        }
    })
})