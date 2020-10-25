$(() => {

  function statusChangeCallback(response){
    console.log('statusChangeCallback');
    console.log(response);
    if (response.status === 'connected') {
      testAPI();
    } else {
      document.getElementById('status').innerHTML = 'Caro dev, faça seu login! O código brilhantemente programado por você te dará acesso ao sistema!';
    }
  }
 
  function checkLoginState() {
    FB.getLoginStatus((response) => {
      statusChangeCallback(response);
    })
  }
 
  window.fbAsyncInit = function(){
    FB.init({
      appId : '372324997223866',
      autoLogAppEvents : true,
      xfbml : true,
      version : 'v8.0'
    })
 
    FB.getLoginStatus((response) => {
      statusChangeCallback(response);
    })
  }
 
  function testAPI(){
    console.log('Welcome! Fetching your information...');
    FB.api('/me', (response) => {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML = 
        'Você está logado, caro ' + response.name + ',rei deste código!';
      })
   }
});