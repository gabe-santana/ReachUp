$(()=>{
  

    $(".square").on("click", function(e) {
        draw(this);
    });

    $("#addRoute").click(function(){
        addHallToJson();
    });

    $("#addLocal").click(function(){
        addLocaltoJson();
    });

    $("#addTriBeacon").click(function(){
       
        /*var squares = document.querySelectorAll(".square");
        var count = 0;

        for (let i = 0; i < squares.length; i++){
            if (count > 2 && squares[i].style.color == "#bd0000"){
                break;
            }
            else if (squares[i].style.color == "#bd0000" && count < 3){
                count++;
            }
        }

        if (count == 3)*/
        addTriBeacontoJson();
        /*}
        else{
            alert("error");
        }*/
    });

    $("#clear").click(function(){
        clear();
    });
});