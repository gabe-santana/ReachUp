$( () => {

    const clsFeedback = new FeedbackController();

    getByType(0);

    function turnFeedbacksOff()
    {
        const feedbacksSection = $("#feedbacks");
        feedbacksSection.empty();
    }

    function showFeedbacks(feedbacks)
    {
        turnFeedbacksOff();
        const feedbacksSection = $("#feedbacks");

        feedbacks.forEach(feedback => {

            const div = document.createElement('div');
            div.classList.add('list-group-item');
            div.classList.add('list-group-item-action');

            const div2 = document.createElement('div');
            div2.classList.add('d-flex');
            div2.classList.add('w-100');
            div2.classList.add('justify-content-between');

            const h5 = document.createElement('h5');

            h5.innerText = feedback.feedbackUser.name;
            h5.classList.add('mb-1');
            div2.append(h5);

            div.append(div2);

            const pText = document.createElement('p');
            pText.innerText = feedback.description;
            pText.classList.add('mb-1');
            div.append(pText);

            const pType = document.createElement('p');
            pType.innerText = feedback.typeName;
            pType.classList.add('mb-1');
            div.append(pType);

            const span1 = document.createElement('span');
            span1.classList.add("fa"); 
            span1.classList.add("fa-star");

            const span2 = document.createElement('span');
            span2.classList.add("fa"); 
            span2.classList.add("fa-star");

            const span3 = document.createElement('span');
            span3.classList.add("fa"); 
            span3.classList.add("fa-star");

            const span4 = document.createElement('span');
            span4.classList.add("fa"); 
            span4.classList.add("fa-star");
            div.append(span4);

            const span5 = document.createElement('span');
            span5.classList.add("fa"); 
            span5.classList.add("fa-star");

            const starsAmount = feedback.stars;

            for (var i = 0; i < starsAmount; i++)
            {
                switch (i) 
                {
                    case 0:
                        span1.classList.add("checked");
                    break;
                    case 1:
                        span2.classList.add("checked");
                    break;
                    case 2:
                        span3.classList.add("checked");
                    break;
                    case 3:
                        span4.classList.add("checked");
                    break;
                    case 4:
                        span5.classList.add("checked");
                    break;
                }
            }

            div.append(span1);
            div.append(span2);
            div.append(span3);
            div.append(span4);
            div.append(span5);

            feedbacksSection.append(div);

        })
    }

    async function getByType(type)
    {
        const feedbacks = await clsFeedback.getAll(type);
        showFeedbacks(feedbacks);
    }

    async function getByDate(begin, end)
    {
       const type = $("#cmbFeedbackType").val();
       const feedbacks = await clsFeedback.getByDate(type, begin, end);
       showFeedbacks(feedbacks);
    }

    async function getByUser(email)
    {
       const feedbacks = await clsFeedback.getByUser(email);
       showFeedbacks(feedbacks);
    }

    $("#cmbFeedbackType").change(async () => {
        const begin = $("#txtStartDate").val();
        const end = $("#txtEndDate").val();

        if (begin != '' && end != '')
        {
           return await getByDate(begin, end);
        }
        const type = $("#cmbFeedbackType").val();
        await getByType(type);

     })
    
    $("#txtStartDate").change(async () => {
       const begin = $("#txtStartDate").val();
       const end = $("#txtEndDate").val();

       if (begin != '' && end != '')
       {
           await getByDate(begin, end);
       }
    })

    $("#txtEndDate").change(async () => {
        const begin = $("#txtStartDate").val();
        const end = $("#txtEndDate").val();
        
        if (begin != '' && end != '')
        {
           await getByDate(begin, end);
        }
     })

     $("#btnSearchByUser").click( async () => {
         const email = $("#txtClientEmail").val();
         await getByUser(email);
     })
})