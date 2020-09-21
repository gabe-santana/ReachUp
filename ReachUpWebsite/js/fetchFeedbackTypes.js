$(function(){

    import { clsFeedbackTypeRepository } 
    from '../classes/repositories/FeedbackTypeRepository.js';
    
    //const token = sessionStorage.getItem('token');
    main();
    
    async function main()
    {
        const feedbackTypesRepo = new clsFeedbackTypeRepository();
        const cmb = document.querySelector('#cmbFeedbackTypes');

        const feedbackTypes = await feedbackTypesRepo.get();

        feedbackTypes.foreach(feedbackType => {
           const cmbItem = document.createElement('option');
           
           cmbItem.innerText = feedbackType.name;
           cmb.append(cmbItem);
      });

    }
})