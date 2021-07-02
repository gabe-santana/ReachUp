$( () => {

    const clsUser = new UserController();
    const clsLocal = new LocalController();

    let _url = new URL(location.href);
    const _user = _url.searchParams.get('email');

    getShopkeeper(_user);

    async function getShopkeeper(email)
    {
       const shopkeeper = await clsUser.get(email);

       $("#txtShopkeeperEmail").val(shopkeeper.email);
       $("#txtShopkeeperName").val(shopkeeper.name);
       console.log(shopkeeper.admLocal.idLocal);
       $("#cmbStores").val(shopkeeper.admLocal.idLocal);
    }

    async function updateShopkeeper(email, name, password)
    {
       const shopkeeper = new User(name, email, password);
       return await clsUser.update(shopkeeper);
    }

    async function connectAdmin(email, localId)
    {
        return await clsLocal.connectAdmin(email, localId);
    }

    $("#btnUpdateShopkeeper").click(async () => {
        const email = $("#txtShopkeeperEmail");
        const name = $("#txtShopkeeperName");
        const password = $("#txtShopkeeperPassword");
        const localId = $("#cmbStores");

        if (await updateShopkeeper(email.val(), name.val(), password.val()))
        {
            if (await connectAdmin(localId.val()))
            {
               window.history.back();
            }
        }
    })
})