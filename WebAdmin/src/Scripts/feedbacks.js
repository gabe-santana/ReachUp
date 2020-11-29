$( async () => {

    const clsFeedback = new FeedbackController();
    const clsFeedbackType = new FeedbackTypeController();

    getAll();

    function turnFeedbacksOff()
    {
        const feedbacksSection = $("#feedbacks");
        feedbacksSection.empty();
    }

    function showAllFeedbacks(feedbacks)
    {
        const feedbacksSection = $("#feedbacks");

        var date = new Date();

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

            const pType = document.createElement('p');
            pType.innerText = feedback.typeName;
            pType.classList.add('mb-1');
            div.append(pType);

            const pDate = document.createElement('p');

            if (feedback.feedbackDate.substr(0, 2) == date.getDate()
            && feedback.feedbackDate.substr(3, 2) == date.getMonth() + 1
            && feedback.feedbackDate.substr(6, 4) == date.getFullYear())
            {
                pDate.innerText = "Hoje";
            }
            else if (feedback.feedbackDate.substr(0, 2) == date.getDate() - 1 
            && feedback.feedbackDate.substr(3, 2) == date.getMonth() + 1
            && feedback.feedbackDate.substr(6, 4) == date.getFullYear())
            {
                pDate.innerText = "Ontem"; 
            }
            else if (feedback.feedbackDate.substr(0, 2) == date.getDate() - 2
            && feedback.feedbackDate.substr(3, 2) == date.getMonth() + 1
            && feedback.feedbackDate.substr(6, 4) == date.getFullYear())
            {
                pDate.innerText = "Anteontem"; 
            }
            else if (feedback.feedbackDate.substr(6, 4) == date.getFullYear())
            {
                const month = feedback.feedbackDate.substr(3, 2);
                var monthText;

                switch (month)
                {
                    case 01:
                        monthText = "janeiro";
                    break;
                    case 02:
                        monthText = "fevereiro";
                    break;
                    case 03:
                        monthText = "março";
                    break;
                    case 04:
                        monthText = "abril";
                    break;
                    case 05:
                        monthText = "maio";
                    break;
                    case 06:
                        monthText = "junho";
                    break;
                    case 07:
                        monthText = "julho";
                    break;
                    case 08:
                        monthText = "agosto";
                    break;
                    case 09:
                        monthText = "setembro";
                    break;
                    case 10:
                        monthText = "outubro";
                    break;
                    case 11:
                        monthText = "novembro";
                    break;
                    case 12:
                        monthText = "dezembro";
                    break;
                }

                pDate.innerText = `${feedback.feedbackDate.substr(0, 2)} de ${monthText}`;
            }
            else {
                const month = feedback.feedbackDate.substr(3, 2);
                var monthText;

                switch (month)
                {
                    case 01:
                        monthText = "janeiro";
                    break;
                    case 02:
                        monthText = "fevereiro";
                    break;
                    case 03:
                        monthText = "março";
                    break;
                    case 04:
                        monthText = "abril";
                    break;
                    case 05:
                        monthText = "maio";
                    break;
                    case 06:
                        monthText = "junho";
                    break;
                    case 07:
                        monthText = "julho";
                    break;
                    case 08:
                        monthText = "agosto";
                    break;
                    case 09:
                        monthText = "setembro";
                    break;
                    case 10:
                        monthText = "outubro";
                    break;
                    case 11:
                        monthText = "novembro";
                    break;
                    case 12:
                        monthText = "dezembro";
                    break;
                }

                pDate.innerText = `${feedback.feedbackDate.substr(0, 2)} de ${monthText} de ${feedback.feedbackDate.substr(6, 4)}`;
            }
            pDate.classList.add('mb-1');
            div.append(pDate);

            const pText = document.createElement('p');
            pText.innerText = feedback.description;
            pText.classList.add('mb-1');
            div.append(pText);

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

            const pType = document.createElement('p');
            pType.innerText = feedback.typeName;
            pType.classList.add('mb-1');
            div.append(pType);

            const pDate = document.createElement('p');
            
            if (feedback.feedbackDate.substr(0, 2) == date.getDate()
            && feedback.feedbackDate.substr(3, 2) == date.getMonth() + 1
            && feedback.feedbackDate.substr(6, 4) == date.getFullYear())
            {
                pDate.innerText = "Hoje";
            }
            else if (feedback.feedbackDate.substr(0, 2) == date.getDate() - 1 
            && feedback.feedbackDate.substr(3, 2) == date.getMonth() + 1
            && feedback.feedbackDate.substr(6, 4) == date.getFullYear())
            {
                pDate.innerText = "Ontem"; 
            }
            else if (feedback.feedbackDate.substr(0, 2) == date.getDate() - 2
            && feedback.feedbackDate.substr(3, 2) == date.getMonth() + 1
            && feedback.feedbackDate.substr(6, 4) == date.getFullYear())
            {
                pDate.innerText = "Anteontem"; 
            }
            else if (feedback.feedbackDate.substr(6, 4) == date.getFullYear())
            {
                const month = feedback.feedbackDate.substr(3, 2);
                var monthText;

                switch (month)
                {
                    case 01:
                        monthText = "janeiro";
                    break;
                    case 02:
                        monthText = "fevereiro";
                    break;
                    case 03:
                        monthText = "março";
                    break;
                    case 04:
                        monthText = "abril";
                    break;
                    case 05:
                        monthText = "maio";
                    break;
                    case 06:
                        monthText = "junho";
                    break;
                    case 07:
                        monthText = "julho";
                    break;
                    case 08:
                        monthText = "agosto";
                    break;
                    case 09:
                        monthText = "setembro";
                    break;
                    case 10:
                        monthText = "outubro";
                    break;
                    case 11:
                        monthText = "novembro";
                    break;
                    case 12:
                        monthText = "dezembro";
                    break;
                }

                pDate.innerText = `${feedback.feedbackDate.substr(0, 2)} de ${monthText}`;
            }
            else {
                const month = feedback.feedbackDate.substr(3, 2);
                var monthText;

                switch (month)
                {
                    case 01:
                        monthText = "janeiro";
                    break;
                    case 02:
                        monthText = "fevereiro";
                    break;
                    case 03:
                        monthText = "março";
                    break;
                    case 04:
                        monthText = "abril";
                    break;
                    case 05:
                        monthText = "maio";
                    break;
                    case 06:
                        monthText = "junho";
                    break;
                    case 07:
                        monthText = "julho";
                    break;
                    case 08:
                        monthText = "agosto";
                    break;
                    case 09:
                        monthText = "setembro";
                    break;
                    case 10:
                        monthText = "outubro";
                    break;
                    case 11:
                        monthText = "novembro";
                    break;
                    case 12:
                        monthText = "dezembro";
                    break;
                }

                pDate.innerText = `${feedback.feedbackDate.substr(0, 2)} de ${monthText} de ${feedback.feedbackDate.substr(6, 4)}`;
            }
            pDate.classList.add('mb-1');
            div.append(pDate);

            const pText = document.createElement('p');
            pText.innerText = feedback.description;
            pText.classList.add('mb-1');
            div.append(pText);

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

    async function getAll()
    {
        const feedbackTypes = await clsFeedbackType.getAll();
 
        feedbackTypes.forEach(feedbackType => {
           getAllByType(feedbackType.id);
        })
    }

    async function getAllByType(type)
    {
        const feedbacks = await clsFeedback.getAll(type);
        console.log(feedbacks);
        showAllFeedbacks(feedbacks);
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

     $("#txtClientEmail").change( async () => {
         const email = $("#txtClientEmail").val();
         await getByUser(email);
     })
})