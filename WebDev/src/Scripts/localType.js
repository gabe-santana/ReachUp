$( async () => {

   const clsLocalType = new clsLocalTypeController();
   const localTypes = await clsLocalType.GetAll();

   const cmbTypes = $("#cmbLocalType");

   localTypes.forEach(localType => {
     const option = document.createElement('option');
     option.value = localType.id;
     option.innerText = localType.name;
     cmbTypes.append(option);
   })
})