import { LocalTypeController } from '../Controllers/LocalTypeController.ts';

$( async () => {

   const clsLocalType = new LocalTypeController.clsLocalTypeController();
   const localTypes = await clsLocalType.GetAll();

   const cmbTypes = $("#cmbLocalType");

   localTypes.forEach(localType => {
     const option = document.createElement('option');
     option.innerHTML = localType.id;
     option.innerText = localType.name;
     cmbTypes.append(option);
   })
})