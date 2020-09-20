$(function(){

    let feedbackTypes = [];
    const token = sessionStorage.getItem('token');

    
    getFeedbackTypes();

    function getFeedbackTypes()
    {

        /*fetch(uri, {
           method: 'GET',
           headers: {
            'Accept':'application/json',
            'Content-Type':'application/json',
            'Authorization':'Bearer ' + token
           },
        })
          .then (feedbackTypes = JSON.parse(response => response.json()))
          .then(() => {
            displayFeedbackTypes(feedbackTypes);
          })
          .catch(error => console.error('Não foi possível acessar os tipos de feedback', error))*/
    }

    function displayFeedbackTypes(feedbackTypes)
    {
       for (let i = 0; i < feedbackTypes.length; i++) {
           $('#cmbFeedbackTypes').append('<option>' + feedbackTypes[i] + '</option>');
        }
    }
})