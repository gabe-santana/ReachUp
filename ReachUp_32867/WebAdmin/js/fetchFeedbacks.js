$(function(){

    import { clsFeedbackRepository } 
    from '../classes/repositories/FeedbackRepository.js';

    //const token = sessionStorage.getItem('token');

    const urlParams = new URLSearchParams(window.location.search);
    const type = urlParams.get('type');

    if (type) {
        getFeedbacksOfType(type);
    }


    $('#cmbFeedbackTypes').change(function(){
        const type = ('#cmbFeedbackTypes').val();
        getFeedbacksOfType(type);
    })

    async function getFeedbacksOfType(type)
    {
        const feedbacksRepo = new clsFeedbackRepository();
        const section = document.querySelector('#feedbacks');

        const feedbacks = await feedbacksRepo.getByType(type);

          feedbacks.foreach(feedback => {
               const divItem = document.createElement('div');
            
               divItem.id = feedback.id;
               divItem.innerText = feedback.user + "-" + feedback.description + "-" + feedback.date + " - " + feedback.starsAmount;

               section.append(divItem);
            });
    }
})