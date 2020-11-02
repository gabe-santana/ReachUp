import { BeaconController } from '../Controllers/BeaconController';
import { BeaconTypeController } from '../Controllers/BeaconTypeController';
import { LocalController } from '../Controllers/LocalController';

$(() => {

  $("#adicionar").change(async () => {

    const uuid = '',
          name = '',
          floor = 0;
    const clsBeacon = new BeaconController.clsBeaconController();
    const response = await clsBeacon.Post(
      uuid,
    )

    if (response){
      alert('Beacon(s) adicionado(s) com sucesso!');
      return;
    }
    alert ('Erro ao adicionar beacon(s)!');
    return;
  })
})