$(function(){

    import { clsLocalRepository } 
    from '../classes/repositories/LocalRepository.js'
   
    //const token = sessionStorage.getItem('token');

    /*$('#btnBookLocal').click(function(){
        
         const listLocals = document.querySelector('#list-locals-to-register');
         const local = 
         //const listLocalsItem = document.createElement('li');

         listLocalsItem.innerText = 
    })*/

    $('#btnRegisterLocals').click(function(){

      const listLocalsToRegister = document.querySelector('');

      /*array.foreach(element => {
        
      });*/ ;
        const name = $('#txtLocalName').val();
        const type = $('#localType').val();
        const floor = $('#localFloor').val();
        const beaconUUID = $('#txtLocalBeaconUUID').val();

        const local = [name, type, floor, beaconUUID];
        register(local);

    })

      async function register(local)
      {
        const LocalRepo = new clsLocalRepository();
        const isOK = await LocalRepo.post(local);
        return isOK;
      }
})