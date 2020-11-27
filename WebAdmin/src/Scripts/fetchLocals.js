$( async () => {

    const clsLocal = new LocalController();

    await getByType(0);

    function turnLocalsOff()
    {
        const localsSection = $("#locals");
        localsSection.empty();
    }

    function removeLocals(param)
    {
       const localsSection = $("#locals");
       const banana = Array.from(localsSection);
       
       if (param == 0)
       {
           banana.forEach(local => {

               for (let i = 0; i < local.children.length; i++)
               {
                   if (local.children[i].children[2].innerHTML == 'Local desativo')
                   {
                      local.children[i].remove();
                   }
               }
           })
           return;
       }
       banana.forEach(local => {

        for (let i = 0; i < local.children.length; i++)
        {
            if (local.children[i].children[2].innerHTML == 'Local ativo')
            {
               local.children[i].remove();
            }
        }
    })
    }

    function showLocals(locals)
    {
        turnLocalsOff();
        const localsSection = $("#locals");

        locals.forEach(local => {
          const div = document.createElement('div');
          div.classList.add('list-group-item');
          div.classList.add('list-group-item-action');

          const div2 = document.createElement('div');
          div2.classList.add('d-flex');
          div2.classList.add('w-100');
          div2.classList.add('justify-content-between');

          /*const icon =  document.createElement('img');
          icon.src = `../../public/assets/icons/localType/${local.type}.png`;
          console.log(icon.src);

          div2.append(icon);*/

          const h5 = document.createElement('h5');

          h5.innerText = local.name;
          h5.classList.add('mb-1');
          div2.append(h5);

          div.append(div2);

          const pType = document.createElement('p');
          pType.innerText = local.typeName;
          pType.classList.add('mb-1');
          div.append(pType);

          const isAvailable = document.createElement('small');
          isAvailable.innerHTML = local.isAvailable ? 'Local ativo' : 'Local desativo';
          if (!local.isAvailable)
          {
             isAvailable.classList.add('text-muted');
          }
          div.append(isAvailable);

          const btnUpdate = document.createElement('div');
          btnUpdate.classList.add('icone');
          
          const linkUpdate = document.createElement('a');
          linkUpdate.href = `EditarLocais.html?id=${local.idLocal}`;

          const updateIcon = document.createElement('i');
          updateIcon.classList.add('fas');
          updateIcon.classList.add('fa-cog');
          updateIcon.classList.add('fa-2x');

          linkUpdate.append(updateIcon);
          btnUpdate.append(linkUpdate);
          div.append(btnUpdate);

          localsSection.append(div);
        })

        const banana = $("#btnShowOnlyTheAvailable");
        const apple = $("#btnShowOnlyTheUnavailable");

        if (banana.is(':checked'))
        {
            removeLocals(0);
            alert("ok bye");
        }
        else if (apple.is(':checked'))
        {
            removeLocals(1);
        }
    }

    async function getByType(type)
    {
       const locals = await clsLocal.getAll(type);
       showLocals(locals);
    }

    async function Seek(search)
    {
       const locals = await clsLocal.seek(search);
       showLocals(locals);
    }

    $("#cmbLocalType").change( async () => {
        const type = $("#cmbLocalType").val();
        await getByType(type);
    })

    $("#txtSearch").change( async () => {

        const search = $("#txtSearch").val();
        await Seek(search);
    })
})