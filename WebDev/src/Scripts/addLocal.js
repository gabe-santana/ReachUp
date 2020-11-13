
$(() => {

  $('#btnGuardarLocal').click(() => {
    const localsList = $('#localsList');
    localsList.append();
  })

  $("#btnAdicionar").change(async () => {

    const type = $('#cmbLocalType').val(),
          name = $('#txtLocalName').val(),
          floor = $('#txtLocalFloor').val();
    const clsLocal = clsLocalController();
    
    if (await clsLocal.Add(type, name, floor))
    {
       const uuid = $('#txtLocalBeacon').val();
       const clsBeacon = clsBeaconController();

       /*if (await clsBeacon.Post(uuid, 
             new BeaconType.clsBeaconType(0),
             new Local.clsLocal()))*/
    }
    return 'erro ao add local';
  })
})