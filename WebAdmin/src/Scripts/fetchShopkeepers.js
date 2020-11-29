$( async () => {

    const clsLocal = new LocalController();
    const clsAccount = new AccountController();
    const clsUser = new UserController();

    var iterator = -1;
    var localsNumber = 0;

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
        var localId = -1;

        i = -1;
        shopkeepers.forEach(shopkeeper => {
          i++;

          if (i == 0)
          {
             localId = shopkeeper.admLocal.idLocal;
             const localDiv = document.createElement('div');
            localDiv.classList.add('list-group-item');
            localDiv.classList.add('list-group-item-action');
            localDiv.style.backgroundColor = 'rgb(70, 130, 180, 0.6)';
            localDiv.style.color = "#f5f5f5";

            const div2 = document.createElement('div');
          div2.classList.add('d-flex');
          div2.classList.add('w-100');
          div2.classList.add('justify-content-between');

          const h4 = document.createElement('h4');

          h4.innerText = shopkeeper.admLocal.name;
          h4.classList.add('mb-1');
          div2.append(h4);

          const p = document.createElement('p');

          p.innerText = shopkeeper.admLocal.typeName;
          p.classList.add('mb-1');
          div2.append(p);

          const p2 = document.createElement('p2');

          p2.innerText = shopkeeper.admLocal.isAvailable ? "Local ativo" : "Local desativo";
          p2.classList.add('mb-1');
          div2.append(p2);

          const btnUpdateLocal = document.createElement('button');
          btnUpdateLocal.innerText = "Editar local";
          btnUpdateLocal.id = localId;
          btnUpdateLocal.classList.add('btnUpdateLocal');
          
          div2.append(btnUpdateLocal);

          localDiv.append(div2);
          shopkeepersSection.append(localDiv);
        }
          
          if (shopkeeper.admLocal.idLocal != localId)
          {
            localId = shopkeeper.admLocal.idLocal;
            const localDiv = document.createElement('div');
           localDiv.classList.add('list-group-item');
           localDiv.classList.add('list-group-item-action');
           localDiv.style.backgroundColor = 'rgb(70, 130, 180, 0.6)';
           localDiv.style.color = "#f5f5f5";

           const div2 = document.createElement('div');
         div2.classList.add('d-flex');
         div2.classList.add('w-100');
         div2.classList.add('justify-content-between');

         const h4 = document.createElement('h4');

         h4.innerText = shopkeeper.admLocal.name;
         h4.classList.add('mb-1');
         div2.append(h4);

         const p = document.createElement('p');

         p.innerText = shopkeeper.admLocal.typeName;
         p.classList.add('mb-1');
         div2.append(p);

         const p2 = document.createElement('p2');

         p2.innerText = shopkeeper.admLocal.isAvailable ? "Local ativo" : "Local desativo";
         p2.classList.add('mb-1');
         div2.append(p2);

         const btnUpdateLocal = document.createElement('button');
         btnUpdateLocal.innerText = "Editar local";
         btnUpdateLocal.id = localId;
         btnUpdateLocal.classList.add('btnUpdateLocal');
         
         div2.append(btnUpdateLocal);

         localDiv.append(div2);
         shopkeepersSection.append(localDiv);
          }


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
          linkUpdateLocal.href = `EditarLocais.html?id=${localId}`;          

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

    function showShopkeepersByLocal(shopkeepers, localId, localName, localType, localAvailability)
    {
        if (iterator == 1)
        {
           turnShopkeepersOff();
        }

        const shopkeepersSection = $("#shopkeepers");

            const localDiv = document.createElement('div');
            localDiv.classList.add('list-group-item');
            localDiv.classList.add('list-group-item-action');
            localDiv.style.backgroundColor = 'rgb(70, 130, 180, 0.6)';
            localDiv.style.color = "#f5f5f5";

            const div2 = document.createElement('div');
          div2.classList.add('d-flex');
          div2.classList.add('w-100');
          div2.classList.add('justify-content-between');

          const h4 = document.createElement('h4');

          h4.innerText = localName;
          h4.classList.add('mb-1');
          div2.append(h4);

          const p = document.createElement('p');

          p.innerText = localType;
          p.classList.add('mb-1');
          div2.append(p);

          const p2 = document.createElement('p2');

          p2.innerText = localAvailability ? "Local ativo" : "Local desativo";
          p2.classList.add('mb-1');
          div2.append(p2);

          const btnUpdateLocal = document.createElement('button');
          btnUpdateLocal.innerText = "Editar local";
          btnUpdateLocal.id = localId;
          btnUpdateLocal.classList.add('btnUpdateLocal');
          
          div2.append(btnUpdateLocal);

          localDiv.append(div2);
          shopkeepersSection.append(localDiv);

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

    async function getLocalAdmins(id, name, type, availability)
    {
        const shopkeepers = await clsLocal.getAdmins(id);
        console.log(shopkeepers);

        if (shopkeepers.length != 0)
        {

            var _shopkeepers = [];

            shopkeepers.forEach(shopkeeper => {
                const _user = {
                    name: shopkeeper.name,
                    email: shopkeeper.email,
                    admLocal: {
                        idLocal: id,
                        name: name
                    }
                }
                _shopkeepers.push(_user);
            })
            iterator++;
            showShopkeepersByLocal(_shopkeepers, id, name, type, availability);
        }
    }

    async function searchByLocal(search)
    {
        const locals = await clsLocal.seek(search);

        locals.forEach(local => {
            const id = local.idLocal;
            const name = local.name;
            const type = local.typeName;
            const availability = local.isAvailable;
            getLocalAdmins(id, name, type, availability);
        })
        iterator = 0;
    }

    $("#txtSearch").change( async () => {
        const search  = $("#txtSearch").val();

        const byLocal = $("#btnByLocal");

        if (byLocal.is(':checked'))
        {
           if (search.length > 2)
           {
              return await searchByLocal(search);
           }
        }
        await searchShopkeepers(search);
        
    })

    $(document).on('click', '.btnUpdateLocal', async () => {
        const id = $(this).id;
        alert("cliquei pra editar o local de id" + id);
        window.location.href = `EditarLocais.html?id=${id}`;
    })
})