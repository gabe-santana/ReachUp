$(() => {
   
  $('#github-button').on('click', () => {
    // Inicialize com a sua chave publica de autenticação do app OAuth.io
    OAuth.initialize(`${process.env.OAUTH_KEY}`);
    // Use pop-up para oauth
    // Ou Redirecionamento
    OAuth.popup('github').then(github => {
       console.log('github:', github);
       // Recupera dados do usuário do provedor oauth
       // Para login bem sucessedido, retorna a mensagem de Bem Vindo
       // #me() é um método para recuperar dados do usuário
       // para saber qual URL do provedor OAuth chamar
       github.me().then(data => {
          console.log('me data:', data);
          alert('GitHub seu email é:' + data.email + ".\nAcesse 'Console Log' para mais detalhes");
       });
       // Recupera dados do usuário do provedor OAuth usando #get () e
      // URL do provedor OAuth
     github.get('/user').then(data => {
         console.log('self data:', data);
     })
   });
 })

});