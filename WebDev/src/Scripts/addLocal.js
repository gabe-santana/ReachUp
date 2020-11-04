import { LocalController } from '../Controllers/LocalController';
import { BeaconController } from '../Controllers/BeaconController';
import { BeaconType } from '../Models/BeaconType';
import { Local } from '../Models/Local';

$(() => {

  $('#btnGuardarLocal').click(() => {
    const localsList = $('#localsList');
    localsList.append();
  })

  $("#btnAdicionar").change(async () => {

    const type = $('#cmbLocalType').val(),
          name = $('#txtLocalName').val(),
          floor = $('#txtLocalFloor').val();
    const clsLocal = new LocalController.clsLocalController();
    
    if (await clsLocal.Add(type, name, floor))
    {
       const uuid = $('#txtLocalBeacon').val();
       const clsBeacon = new BeaconController.clsBeaconController();

       /*if (await clsBeacon.Post(uuid, 
             new BeaconType.clsBeaconType(0),
             new Local.clsLocal()))*/
    }
    return 'erro ao add local';
  })
})