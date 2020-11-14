$(async () =>{

    const clsBeaconType = new BeaconTypeController();
    const beaconTypes = await clsBeaconType.GetAll();

    const cmbTypes = $("#cmbBeaconType");

     beaconTypes.forEach(beaconType => {
     const option = document.createElement('option');
     option.value = beaconType.id;
     option.innerText = beaconType.name;
     cmbTypes.append(option);
   })
})