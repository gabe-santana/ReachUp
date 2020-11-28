$( async () => {

    const clsShopping = new ShoppingController();

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

   getShopping();

   async function getShopping()
   {
       const shopping = clsShopping.get();

       $("#txtShoppingName").val(shopping.name);
       $("#txtShoppingWelcomeMessage").val(shopping.message);
    
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
        
         startSeg.val(shopping.openingHours[1].openingTime.substr(0, 5));
         openingHours.seg.openingTime = shopping.openingHours[1].openingTime.substr(0, 5);
         endSeg.val(shopping.openingHours[1].closingTime.substr(0, 5));
         openingHours.seg.closingTime = shopping.openingHours[1].closingTime.substr(0, 5);
         startTer.val(shopping.openingHours[2].openingTime.substr(0, 5));
         openingHours.ter.openingTime = shopping.openingHours[2].openingTime.substr(0, 5);
         endTer.val(shopping.openingHours[2].closingTime.substr(0, 5));
         openingHours.ter.closingTime = shopping.openingHours[2].closingTime.substr(0, 5);
         startQua.val(shopping.openingHours[3].openingTime.substr(0, 5));
         openingHours.qua.openingTime = shopping.openingHours[3].openingTime.substr(0, 5);
         endQua.val(shopping.openingHours[3].closingTime.substr(0, 5));
         openingHours.qua.closingTime = shopping.openingHours[3].closingTime.substr(0, 5);
         startQui.val(shopping.openingHours[4].openingTime.substr(0, 5));
         openingHours.qui.openingTime = shopping.oeningHours[4].openingTime.substr(0, 5);
         endQui.val(shopping.openingHours[4].closingTime.substr(0, 5));
         openingHours.qui.closingTime = shopping.openingHours[4].closingTime.substr(0, 5);
         startSex.val(shopping.openingHours[5].openingTime.substr(0, 5));
         openingHours.sex.openingTime = shopping.openingHours[5].openingTime.substr(0, 5);
         endSex.val(shopping.openingHours[5].closingTime.substr(0, 5));
         openingHours.sex.closingTime = shopping.openingHours[5].closingTime.substr(0, 5);
         startSab.val(shopping.openingHours[6].openingTime.substr(0, 5));
         openingHours.sab.openingTime = shopping.openingHours[6].openingTime.substr(0, 5);
         endSab.val(shopping.alternativeOpeningHours[6].closingTime.substr(0, 5));
         openingHours.sab.closingTime = shopping.openingHours[6].closingTime.substr(0, 5);
         startDom.val(shopping.openingHours[0].openingTime.substr(0, 5));
         openingHours.dom.openingTime = shopping.openingHours[0].openingTime.substr(0, 5);
         endDom.val(shopping.openingHours[0].closingTime.substr(0, 5));
         openingHours.dom.closingTime = shopping.openingHours[0].closingTime.substr(0, 5);
   }

   async function updateShopping(name, message)
   {
       const shopping = new Shopping(name, message);
       await clsLocal.update(shopping);
   }

   async function updateOpHoursShopping()
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
                      await clsShopping.updateOpHours(openingHours);
                   }
                 break;
                 case 1:
                   if (startSeg != openingHours.seg.openingTime || endSeg != openingHours.seg.closingTime)
                   {
                      const openingHours = new OpHours(1, startSeg, endSeg);
                      await clsShopping.updateOpHours(openingHours);
                   }
                 break;
                 case 2:
                   if (startTer != openingHours.ter.openingTime || endTer != openingHours.ter.closingTime)
                   {
                      const openingHours = new OpHours(2, startTer, endTer);
                      await clsShopping.updateOpHours(openingHours);
                   }
                 break;
                 case 3:
                   if (startQua != openingHours.qua.openingTime || endQua != openingHours.qua.closingTime)
                   {
                      const openingHours = new OpHours(3, startQua, endQua);
                      await clsShopping.updateOpHours(openingHours);
                   }
                 break;
                 case 4:
                   if (startQui != openingHours.qui.openingTime || endQui != openingHours.qui.closingTime)
                   {
                      const openingHours = new OpHours(4, startQui, endQui);
                      await clsShopping.updateOpHours(openingHours);
                   }
                 break;
                 case 5:
                   if (startSex != openingHours.sex.openingTime || endSex != openingHours.sex.closingTime)
                   {
                      const openingHours = new OpHours(5, startSex, endSex);
                      await clsShopping.updateOpHours(openingHours);
                   }
                 break;
                 case 6:
                   if (startSab != openingHours.sab.openingTime || endSab != openingHours.sab.closingTime)
                   {
                      const openingHours = new OpHours(6, startSab, endSab);
                      await clsShopping.updateOpHours(openingHours);
                   }
                 break;
             }
         }
    }

    $("#btnUpdateShopping").click(async () => {
        const name = $("#txtShoppingName").val();
        const message = $("#txtShoppingWelcomeMessage").val();
        await updateShopping(name, message);
        await updateOpHoursShopping();
    })

})