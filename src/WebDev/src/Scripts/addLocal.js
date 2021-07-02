$(() => {

  $('#btnGuardarLocal').click(() => {
    const localsList = $('#localsList');
    localsList.append();
  })

  $("#btnAdicionar").click(async () => {

    const clsLocal = new clsLocalController();

    const uuid = $('#txtLocalBeacon').val();

    //if (await clsLocal.checkBeacon(uuid))
    //{
      const type = $('#cmbLocalType').val(),
            name = $('#txtLocalName').val(),
            floor = $('#txtLocalFloor').val(),
            openingHour = $('#txtLocalOpening').val(),
            closingHour = $('#txtLocalClosing').val();

      const local = new Local(
        type, name, floor, openingHour, closingHour, uuid
      );

      if (await clsLocal.Add(local))
      {

          // pegar código do local que foi adicionado, após a primeira requisição
          // se arquivo foi selecionado
          var imagePath = $('#btnLocalImage').val();

          if (imagePath.indexOf('C:\\fakepath\\') > -1)
          {
             imagePath = imagePath.replace('C:\\fakepath\\', '../../dev_assets/');
          }

          //await clsLocal.uploadImage(image);
      }
    //}
  })
})