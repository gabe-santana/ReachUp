import { LocalController } from '../Controllers/LocalController';

$(() => {

  $("#adicionar").change(async () => {

    const type = '',
          name = '',
          floor = 0;
    const clsLocal = new LocalController.clsLocalController();
    const response = await clsLocal.Add(type, name, floor);

    if (response){
      alert('Local adicionado com sucesso!');
      return;
    }
    alert ('Erro ao adicionar local!');
    return;
  })
})