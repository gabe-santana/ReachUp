$(function(){
    
    const uri =  'https://192.168.0.109:8000/api';
    let localTypes = [];
    let localFloorOptions = 0;
    const token = sessionStorage.getItem('token');

    getLocalTypeOptions();
    getLocalFloorOptions();

    function getLocalTypeOptions()
    {
        fetch(uri, {
          method: 'GET',
          headers: {
              'Accept':'application/json',
              'Content-Type':'application/json',
              'Authorization':'Bearer ' + token
          },
        })
          .then (localTypes = JSON.parse(response => response.json()))
          .then(() => {
            displayLocalTypeOptions(localTypes);
          })
          .catch(error => console.error('Não é possível acessar os tipos de local', error))
    }

    function displayLocalTypeOptions(localTypes)
    {
       for (let i = 0; i < localTypes.length; i++) {
           $('#cmbLocalType').append('<option>' + localTypes[i] + '</option>');
           
       }
    }

    function getLocalFloorOptions()
    {
        fetch(uri, {
          method: 'GET',
          headers: {
              'Accept':'application/json',
              'Content-Type':'application/json',
              'Authorization':'Bearer ' + token
          },
        })
        .then (localFloorOptions = JSON.parse(response => response.json()))
        .then(() => {
            displayLocalFloorOptions(localFloorOptions);
          })
        .catch(error => console.error('Não é possível acessar as opções de andar', error))
    }

    function displayLocalFloorOptions(localFloorOptions)
    {
       for (let i = 0; i < localFloorOptions.length; i++) {
           $('#cmbLocalFloor').append('<option>' + localFloorOptions[i] + '</option>');
           
       }
    }

})