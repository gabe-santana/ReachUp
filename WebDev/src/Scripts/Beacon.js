$(() => {

  $("#adicionar").change(async () => {

    const uuid = '',
          name = '',
          floor = 0;
    const clsBeacon = clsBeaconController();
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