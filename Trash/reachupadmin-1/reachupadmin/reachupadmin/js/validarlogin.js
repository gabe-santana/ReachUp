$(document).ready(function () {
    var token = "";
    var urlapi = "http://192.168.0.3:5000/api/";
    $("#btn_token").click(function () {
        $.ajax({
            url: urlapi + "Account/Login?Email=adm@email.com&Password=123",
            method: "post",
            contentType: "application/json",
            success: function (dados) {
                token = dados["token"]
                alert(token);
            }
        }
        )
            ,})
});