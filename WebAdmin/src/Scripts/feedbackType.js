$( async () => {

    
    const clsFeedbackType = new FeedbackTypeController();
    const feedbackTypes = await clsFeedbackType.getAll();
    console.log(feedbackTypes);
 
    const cmbTypes = $("#cmbFeedbackType");
 
     feedbackTypes.forEach(feedbackType => {
      const option = document.createElement('option');
      option.value = feedbackType.id;
      option.innerText = feedbackType.name;
      cmbTypes.append(option);
    })
 })