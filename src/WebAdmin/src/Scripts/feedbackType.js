$( async () => {

    
    const clsFeedbackType = new FeedbackTypeController();
    const feedbackTypes = await clsFeedbackType.getAll();

    const cmbTypes = $("#cmbFeedbackType");
 
     feedbackTypes.forEach(feedbackType => {
      const option = document.createElement('option');
      option.id = feedbackType.id;
      option.value = feedbackType.id;
      option.innerText = feedbackType.name;
      cmbTypes.append(option);
    })

 })