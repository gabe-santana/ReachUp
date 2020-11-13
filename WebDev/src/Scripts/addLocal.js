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



      await clsLocal.Add(local);
    //}
  })
})