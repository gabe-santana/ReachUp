$(() => {

    $('#btnLogOut').click(() => {
       localStorage.clear();
       window.location.replace = '../../public/index.html';
    })
})