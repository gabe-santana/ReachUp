$( async () => {

     const clsLocal = new LocalController();

     let _url = new URL(location.href);
     const localId = _url.searchParams.get('id');

     var localType = 0;

     var openingHours = {
         dom: {
           openingTime: '',
           closingTime: ''
         },
         seg: {
            openingTime: '',
            closingTime: ''
          },
         ter: {
            openingTime: '',
            closingTime: ''
        },
        qua: {
            openingTime: '',
            closingTime: ''
        },
        qui: {
            openingTime: '',
            closingTime: ''
        },
        sex: {
            openingTime: '',
            closingTime: ''
        },
        sab: {
            openingTime: '',
            closingTime: ''
        }
    };

     getLocal(localId);

     async function getLocal(id)
     {
         const local = await clsLocal.get(id);
         
         const localHeader = $("#localEdition");

         const div = document.createElement('div');
         div.classList.add('list-group-item');
         div.classList.add('list-group-item-action');
         div.style.backgroundColor = 'rgba(70, 130, 180, 0.8)';
         div.style.color = 'rgb(245, 245, 245)';

         const div2 = document.createElement('div');
         div2.classList.add('d-flex');
         div2.classList.add('w-100');
         div2.classList.add('justify-content-between');
         
         const h4 = document.createElement('h4');
         h4.classList.add('mb-1');
         h4.innerHTML = local.name;

         const p = document.createElement('p');
         p.classList.add('mb-1');
         p.innerHTML = local.typeName;

         div2.append(h4);
         div2.append(p);
         div.append(div2);
         localHeader.append(div);

         $("#txtLocalName").val(local.name);
         $("#txtLocalFloor").val(local.floor);

         const pLocalState = $("#txtLocalAvailability");
         pLocalState.innerText =  local.isAvailable ? 'Local ativo' : 'Local desativo';

         const startSeg = $("#startSeg");
         const endSeg = $("#endSeg");
         const startTer = $("#startTer");
         const endTer = $("#endTer");
         const startQua = $("#startQua");
         const endQua = $("#endQua");
         const startQui = $("#startQui");
         const endQui = $("#endQui");
         const startSex = $("#startSex");
         const endSex = $("#endSex");
         const startSab = $("#startSab");
         const endSab = $("#endSab");
         const startDom = $("#startDom");
         const endDom = $("#endDom");


         startSeg.val(local.alternativeOpeningHours[1].openingTime.substr(0, 5));
         openingHours.seg.openingTime = local.alternativeOpeningHours[1].openingTime.substr(0, 5);
         endSeg.val(local.alternativeOpeningHours[1].closingTime.substr(0, 5));
         openingHours.seg.closingTime = local.alternativeOpeningHours[1].closingTime.substr(0, 5);
         startTer.val(local.alternativeOpeningHours[2].openingTime.substr(0, 5));
         openingHours.ter.openingTime = local.alternativeOpeningHours[2].openingTime.substr(0, 5);
         endTer.val(local.alternativeOpeningHours[2].closingTime.substr(0, 5));
         openingHours.ter.closingTime = local.alternativeOpeningHours[2].closingTime.substr(0, 5);
         startQua.val(local.alternativeOpeningHours[3].openingTime.substr(0, 5));
         openingHours.qua.openingTime = local.alternativeOpeningHours[3].openingTime.substr(0, 5);
         endQua.val(local.alternativeOpeningHours[3].closingTime.substr(0, 5));
         openingHours.qua.closingTime = local.alternativeOpeningHours[3].closingTime.substr(0, 5);
         startQui.val(local.alternativeOpeningHours[4].openingTime.substr(0, 5));
         openingHours.qui.openingTime = local.alternativeOpeningHours[4].openingTime.substr(0, 5);
         endQui.val(local.alternativeOpeningHours[4].closingTime.substr(0, 5));
         openingHours.qui.closingTime = local.alternativeOpeningHours[4].closingTime.substr(0, 5);
         startSex.val(local.alternativeOpeningHours[5].openingTime.substr(0, 5));
         openingHours.sex.openingTime = local.alternativeOpeningHours[5].openingTime.substr(0, 5);
         endSex.val(local.alternativeOpeningHours[5].closingTime.substr(0, 5));
         openingHours.sex.closingTime = local.alternativeOpeningHours[5].closingTime.substr(0, 5);
         startSab.val(local.alternativeOpeningHours[6].openingTime.substr(0, 5));
         openingHours.sab.openingTime = local.alternativeOpeningHours[6].openingTime.substr(0, 5);
         endSab.val(local.alternativeOpeningHours[6].closingTime.substr(0, 5));
         openingHours.sab.closingTime = local.alternativeOpeningHours[6].closingTime.substr(0, 5);
         startDom.val(local.alternativeOpeningHours[0].openingTime.substr(0, 5));
         openingHours.dom.openingTime = local.alternativeOpeningHours[0].openingTime.substr(0, 5);
         endDom.val(local.alternativeOpeningHours[0].closingTime.substr(0, 5));
         openingHours.dom.closingTime = local.alternativeOpeningHours[0].closingTime.substr(0, 5);

     }

     async function updateLocal(id, name, type, floor)
     {
         const local = new Local(name, type, floor, id);
         await clsLocal.update(local); 
     }

     async function refreshLocalAvailability(id)
     {
        return await clsLocal.updateAvailability(id);
     }

     function refreshLocalState()
     {  
        const localState = $("#txtLocalAvailability").val();
        const pLocalState = $("#txtLocalAvailability");

        pLocalState.innerText = localState == 'Local ativo' ? 'Local desativo' : 'Local ativo';
     }

     async function updateOpHoursLocal()
     {
        const startSeg = $("#startSeg").val();
        const endSeg = $("#endSeg").val();
        const startTer = $("#startTer").val();
        const endTer = $("#endTer").val();
        const startQua = $("#startQua").val();
        const endQua = $("#endQua").val();
        const startQui = $("#startQui").val();
        const endQui = $("#endQui").val();
        const startSex = $("#startSex").val();
        const endSex = $("#endSex").val();
        const startSab = $("#startSab").val();
        const endSab = $("#endSab").val();
        const startDom = $("#startDom").val();
        const endDom = $("#endDom").val();

         for (var i = 0; i < 7; i++)
         {
             switch (i)
             {
                 case 0:
                   if (startDom != openingHours.dom.openingTime || endDom != openingHours.dom.closingTime)
                   {
                      const openingHours = new OpHours(0, startDom, endDom);
                      await clsLocal.addOpHours(localId, openingHours);
                   }
                 break;
                 case 1:
                   if (startSeg != openingHours.seg.openingTime || endSeg != openingHours.seg.closingTime)
                   {
                      const openingHours = new OpHours(1, startSeg, endSeg);
                      await clsLocal.addOpHours(localId, openingHours);
                   }
                 break;
                 case 2:
                   if (startTer != openingHours.ter.openingTime || endTer != openingHours.ter.closingTime)
                   {
                      const openingHours = new OpHours(2, startTer, endTer);
                      await clsLocal.addOpHours(localId, openingHours);
                   }
                 break;
                 case 3:
                   if (startQua != openingHours.qua.openingTime || endQua != openingHours.qua.closingTime)
                   {
                      const openingHours = new OpHours(3, startQua, endQua);
                      await clsLocal.addOpHours(localId, openingHours);
                   }
                 break;
                 case 4:
                   if (startQui != openingHours.qui.openingTime || endQui != openingHours.qui.closingTime)
                   {
                      const openingHours = new OpHours(4, startQui, endQui);
                      await clsLocal.addOpHours(localId, openingHours);
                   }
                 break;
                 case 5:
                   if (startSex != openingHours.sex.openingTime || endSex != openingHours.sex.closingTime)
                   {
                      const openingHours = new OpHours(5, startSex, endSex);
                      await clsLocal.addOpHours(localId, openingHours);
                   }
                 break;
                 case 6:
                   if (startSab != openingHours.sab.openingTime || endSab != openingHours.sab.closingTime)
                   {
                      const openingHours = new OpHours(6, startSab, endSab);
                      await clsLocal.addOpHours(localId, openingHours);
                   }
                 break;
             }
         }
     }

     $("#btnRefreshAvailability").click(async () => {
        if (await refreshLocalAvailability(localId))
        {
           refreshLocalState();
           alert("tentei trocar o estado");
        }
     })

     $("#btnUpdateLocal").click(async () => {
         const name = $("#txtLocalName").val();
         const floor = $("#txtLocalFloor").val();
         await updateLocal(localId, name, localType, floor);
         await updateOpHoursLocal();
     })
})