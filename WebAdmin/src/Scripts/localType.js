$( async () => {

    const clsLocalType = new LocalTypeController();
    const localTypes = await clsLocalType.getAll();
 
    const cmbTypes = $("#cmbLocalType");
 
    localTypes.forEach(localType => {
      const option = document.createElement('option');
      option.value = localType.id;
      option.innerText = localType.name;
      cmbTypes.append(option);
    })
 })