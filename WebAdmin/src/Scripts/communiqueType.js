$( async () => {

    const clsCommuniqueType = new CommuniqueTypeController();
    const communiqueTypes = await clsCommuniqueType.getAll();
 
    const cmbTypes = $("#cmbCommuniqueType");
 
    communiqueTypes.forEach(communiqueType => {
      const option = document.createElement('option');
      option.value = communiqueType.id;
      option.innerText = communiqueType.name;
      cmbTypes.append(option);
    })
 })