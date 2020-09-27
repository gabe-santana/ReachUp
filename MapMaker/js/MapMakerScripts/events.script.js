$(document).ready(()=>{
    $(".square").on("click", function(e) {
 
        draw(this);
    });

    $("#addRoute").click(function(){
        addToJson();
    });

    $("#clear").click(function(){
        clear();
    });
});