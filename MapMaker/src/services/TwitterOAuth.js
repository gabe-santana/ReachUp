$(() => {
    
   $('#twitter-button').on('click', () => {
    OAuth.initialize(`${process.env.OAUTH_KEY}`);

    OAuth.popup('twitter').then(twitter => {
      console.log('twitter:', twitter);

      twitter.get('/1.1/account/verify_credentials.json?include_email=true')
       .then(data => {
         console.log('self data:', data);
       })
    })
  })
})