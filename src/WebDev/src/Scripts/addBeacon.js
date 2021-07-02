$(() => {

  $('#btnAdicionar').click(async () => {

    const clsBeacon = new BeaconController();
    const uuid = $('#txtUUID').val();
    const type = $('#cmbBeaconType').val();
    const localId = $('#txtLocalId').val();

    const beacon = new Beacon(
      uuid, type
    );

    await clsBeacon.add(beacon, localId);
  })
})