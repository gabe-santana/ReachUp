$(function(){

    let feedbacks = [];
    const token = sessionStorage.getItem('token');

    $('#cmbFeedbackTypes').change(function(){
        var feedbackType = ('#cmbFeedbackTypes').val();
        getFeedbacks(feedbackType);
    })

    function getFeedbacks(feedbackType)
    {
        const uri = 'https://192.168.0.109:8000/api' + "" + feedbackType;

        fetch(uri, {
           method: 'GET',
           headers: {
            'Accept':'application/json',
            'Content-Type':'application/json',
            'Authorization':'Bearer ' + token
        },
      })
          .then (feedbacks = JSON.parse(response => response.json()))
          .then(() => {
            displayFeedbacks(feedbacks);
          })
          .catch(error => console.error('Não foi possível acessar os feedbacks', error))
    }

    function displayFeedbacks(feedbacks)
    {
        for (let i = 0; i < feedbacks.length; i++) {
            $('feedbacks').append('<div>' + "" + '</div>');
            
        }
    }

})