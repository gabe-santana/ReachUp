$(function(){
    
  import { clsLocalOptionsRepository } 
  from '../classes/repositories/LocalOptionsRepository.js'
    
    //const token = sessionStorage.getItem('token');

    getLocalTypeOptions();
    getLocalFloorOptions();

    async function getLocalTypeOptions()
    {
        const cmb = document.querySelector('#cmbLocalType');
        const LocalOptionsRepo = new clsLocalOptionsRepository();
        const localTypes = await LocalOptionsRepo.getLocalTypes();

        localTypes.foreach(localType => {
             const cmbItem = document.createElement('option');
             cmbItem.innerText = localType.name;
             cmb.append(cmbItem);
            });
    }

    async function getLocalFloorOptions()
    {
        const cmb = document.querySelector('#cmbLocalFloor');
        const LocalOptionsRepo = new clsLocalOptionsRepository();
        const floorOptions = await LocalOptionsRepo.getFloorOptions();

        floorOptions.foreach(floorOption => {
        const cmbItem = document.createElement('option');
        cmbItem.innerText = floorOption.name;
        cmb.append(cmbItem);
       });
    }
})