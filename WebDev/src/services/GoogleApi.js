$(() => {

  function onSignIn(googleUser) {
    const profile = googleUser.getBasicProfile();
    const email = profile.getId(); // emails são voláteis
    const name = profile.getName();
    const image = profile.getImageUrl();
    const id_token = googleUser.getAuthResponse().id_token;

    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'https://yourbackend.example.com/tokensignin');
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onload = () => {
     console.log('Signed in as: ' + xhr.responseText);
    };
    xhr.send('idtoken=' + id_token);

  }

  // auth2 is initialized with gapi.auth2.init() and a user is signed in.

  function signIn(){
    if (auth2.isSignedIn.get()) {
      const profile = auth2.currentUser.get().getBasicProfile();
      const email = profile.getId(); // emails são voláteis
      const name = profile.getName();
      const image = profile.getImageUrl();
      const givenName = profile.getGivenName();
      const familyName = profile.getFamilyName();
    }
  }

  //<a href="#" onclick="signOut();">Sign out</a>

  function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(() => {
      console.log('User signed out.');
    });
  }

})