$(function(){

  $("#btnLogin").click(function(){

    var email = ('#txtEmail').val();
    var password = ('#txtPassword').val();

    const uri =  'https://192.168.0.109:8000/api/Account/Login?Email=' + email + '&Password=' + password + '&Role=adm';
    var result = "";

    getUser();

    function getUser()
    {
        fetch(uri, {
          method: 'GET',
          headers: {
              'Accept':'application/json',
              'Content-Type':'application/json'
          },
        })
          .then (result = JSON.parse(response => response.json()))
          .then(sessionStorage.setItem('token', '${result.access_token}'))
          .then(() => {
            return '${result.nm_user}';
          })
          return false;
    }

  })

})