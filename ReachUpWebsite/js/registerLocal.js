$(function(){

    let ab = [];
    const token = sessionStorage.getItem('token');

    $('btnRegisterLocal').click(function(){

      for (let index = 0; index < array.length; index++) {
        const uri =  'https://192.168.0.109:8000/api/Account/Login?Email=' + email + '&Password=' + password + '&Role=adm';
          registerLocal();
      }

    })

      function registerLocal()
      {
          fetch(uri, {
              method: 'POST',
              headers: {
                  'Accept':'application/json',
                  'Content-Type':'application/json',
                  'Authorization':'Bearer ' + token
              },
              body: JSON.stringify('object')
          })
            .then (response => response.json())
            .then(() => {
                return true;
              })
            .catch(error => console.error('Não foi possível registrar o local', error))
            .catch(() => {
                return false;
              })
      }
})