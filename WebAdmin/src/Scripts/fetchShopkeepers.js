$( async () => {

    const clsLocal = new LocalController();
    const clsAccount = new AccountController();
    const clsUser = new UserController();

    getAll();

    function turnShopkeepersOff()
    {
        const shopkeepersSection = $("#shopkeepers");
        shopkeepersSection.empty();
    }

    function showShopkeepers(shopkeepers)
    {
        turnShopkeepersOff();
        const shopkeepersSection = $("#shopkeepers");

        shopkeepers.forEach(shopkeeper => {
          const div = document.createElement('div');
          div.classList.add('list-group-item');
          div.classList.add('list-group-item-action');

          const div2 = document.createElement('div');
          div2.classList.add('d-flex');
          div2.classList.add('w-100');
          div2.classList.add('justify-content-between');

          const h5 = document.createElement('h5');

          h5.innerText = shopkeeper.name;
          h5.classList.add('mb-1');
          div2.append(h5);

          div.append(div2);

          const pLocal = document.createElement('p');
          pLocal.innerText = shopkeeper.admLocal.name;
          pLocal.classList.add('mb-1');
          div.append(pLocal);

          const btnUpdateLocal = document.createElement('div');
          btnUpdateLocal.classList.add('icone');

          const linkUpdateLocal = document.createElement('a');
          linkUpdateLocal.href = `EditarLocais.html?id=${shopkeeper.admLocal.idLocal}`;          

          const updateLocalIcon = document.createElement('i');
          updateLocalIcon.classList.add('fas');
          updateLocalIcon.classList.add('fa-cog');
          updateLocalIcon.classList.add('fa-2x');

          linkUpdateLocal.append(updateLocalIcon);
          btnUpdateLocal.append(linkUpdateLocal);
          div.append(btnUpdateLocal);

          const btnUpdate = document.createElement('div');
          btnUpdate.classList.add('icone');

          const linkUpdate = document.createElement('a');
          linkUpdate.href = `EditarLojista.html?email=${shopkeeper.email}`;

          const updateIcon = document.createElement('i');
          updateIcon.classList.add('fas');
          updateIcon.classList.add('fa-cog');
          updateIcon.classList.add('fa-2x');

          linkUpdate.append(updateIcon);
          btnUpdate.append(linkUpdate);
          div.append(btnUpdate);

          shopkeepersSection.append(div);
        })
    }

    async function getAll()
    {
        const shopkeepers = await clsUser.getAll();
        showShopkeepers(shopkeepers);
    }

    async function searchShopkeepers(name)
    {
        const shopkeepers = await clsAccount.searchShopkeeperByName(name);
        showShopkeepers(shopkeepers);
    }

    /*function getLocalAdmins(id)
    {
       return await clsLocal.getAdmins(id);
       console.log(admins);
    }*/

    /*async function searchByLocal(search)
    {
        const locals = await clsLocal.seek(search);

        //for (let i = 0; i < locals.)

        locals.forEach(local => {
            const id = local.idLocal;
            const admins = getLocalAdmins(id);
            console.log(admins);
            var shopkeepers = {};

            admins.forEach(admin => {
                const shopkeeper = {
                    name: admin.name,
                    email: admin.email,
                    admLocal: {
                        idLocal: local.idLocal,
                        name: local.name,
                    }
                }
                shopkeepers.add(shopkeeper);
            })
            showShopkeepers(shopkeepers);
        })
    }*/

    $("#txtSearch").change( async () => {
        const search  = $("#txtSearch").val();

        const byShopkeeper = $("#btnByShopkeeper");

        //if (byShopkeeper.is(':checked'))
        //{
           return await searchShopkeepers(search);
        //}
        //await searchByLocal(search);
        
    })
})