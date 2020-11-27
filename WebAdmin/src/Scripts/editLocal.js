$( async () => {

     const clsLocal = new LocalController();

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

     getLocal(5);

     async function getLocal(id)
     {
         const local = await clsLocal.get(id);

         $("#txtLocalName").val(local.name);
         console.log(local.type); // pegar o tipo certo
         $("#txtLocalFloor").val(local.type);
         localType = local.type;

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

         console.log(openingHours);
     }

     async function updateLocal(id, name, type, floor)
     {
         const local = new Local(name, type, floor, id);
         await clsLocal.update(local); 
     }

     async function updateOpHoursLocal()
     {
        const startSeg = $("#startSeg").val();
        console.log(startSeg);
        const endSeg = $("#endSeg").val();
        const startTer = $("#startTer").val();
        console.log(startTer);
        const endTer = $("#endTer").val();
        const startQua = $("#startQua").val();
        console.log(startQua);
        const endQua = $("#endQua").val();
        const startQui = $("#startQui").val();
        console.log(startQui);
        const endQui = $("#endQui").val();
        const startSex = $("#startSex").val();
        console.log(startSex);
        const endSex = $("#endSex").val();
        const startSab = $("#startSab").val();
        console.log(startSab);
        const endSab = $("#endSab").val();
        const startDom = $("#startDom").val();
        console.log(startDom);
        const endDom = $("#endDom").val();

         for (var i = 0; i < 7; i++)
         {
             switch (i)
             {
                 case 0:
                   if (startDom != openingHours.dom.openingTime || endDom != openingHours.dom.closingTime)
                   {
                      const openingHours = new OpHours(0, startDom, endDom);
                      await clsLocal.addOpHours(5, openingHours);
                   }
                 break;
                 case 1:
                   if (startSeg != openingHours.seg.openingTime || endSeg != openingHours.seg.closingTime)
                   {
                      const openingHours = new OpHours(1, startSeg, endSeg);
                      await clsLocal.addOpHours(5, openingHours);
                   }
                 break;
                 case 2:
                   if (startTer != openingHours.ter.openingTime || endTer != openingHours.ter.closingTime)
                   {
                      const openingHours = new OpHours(2, startTer, endTer);
                      await clsLocal.addOpHours(5, openingHours);
                   }
                 break;
                 case 3:
                   if (startQua != openingHours.qua.openingTime || endQua != openingHours.qua.closingTime)
                   {
                      const openingHours = new OpHours(3, startQua, endQua);
                      await clsLocal.addOpHours(5, openingHours);
                   }
                 break;
                 case 4:
                   if (startQui != openingHours.qui.openingTime || endQui != openingHours.qui.closingTime)
                   {
                      const openingHours = new OpHours(4, startQui, endQui);
                      await clsLocal.addOpHours(5, openingHours);
                   }
                 break;
                 case 5:
                   if (startSex != openingHours.sex.openingTime || endSex != openingHours.sex.closingTime)
                   {
                      const openingHours = new OpHours(5, startSex, endSex);
                      await clsLocal.addOpHours(5, openingHours);
                   }
                 break;
                 case 6:
                   if (startSab != openingHours.sab.openingTime || endSab != openingHours.sab.closingTime)
                   {
                      const openingHours = new OpHours(6, startSab, endSab);
                      await clsLocal.addOpHours(5, openingHours);
                   }
                 break;
             }
         }
     }

     $("#btnUpdateLocal").click(async () => {
         const name = $("#txtLocalName").val();
         const floor = $("#txtLocalFloor").val();
         await updateLocal(5, name, localType, floor);
         await updateOpHoursLocal();
     })
})