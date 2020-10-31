$(()=>{


    var clicked = false;
    var squares = document.querySelectorAll('.square');

    $('.square').click(function(){
       draw(this);
    });

    squares.forEach(square => {
        square.addEventListener('mousedown', function(){
            clicked = true;
        });
        square.addEventListener('mouseup', function(){
            clicked = false;
        });
        square.addEventListener('mouseover', function(){
            if (clicked){
                draw(square);
            }
        });
    });

    /*$('.square').mouseout(function(){
        clicked = false;
    })*/

    $("#floor").bind("input",function(){
        var floor = this.value;
        if (floor == ""){
            this.value = 0;
            floor = 0;
        }
        //clearDraw();
        //clearArrays();
        // clear();
        setCurrentFloor(floor);
        //hatchMap();
        // renderMap();
    })

    $("#addRoute").click(function(){
        $("#cbCornerUp").prop("checked",false);
        $("#cbCornerDown").prop("checked",false);
        $("#cbCornerLeft").prop("checked",false);
        $("#cbCornerRight").prop("checked",false);
        addHallToJson();
    });

    $("#addLocal").click(function(){
        addLocaltoJson();
    });

    
    $("#addAll").click(function(){
        addAlltoJson();
    });

 

    $("#clear").click(function(){
        if (pendingAdditions == 0){
           clear();
           this.disabled = true;
           document.getElementById('showMap').disabled = false;
        } else {
            alert('Há alterações não adicionadas!');
        }
        
    });

    $('#showMap').click(function(){
        hatchMap();
        this.disabled = true;
        document.getElementById('clear').disabled = false;

    })


    // $("input[type=radio][id=cbCorner]").change(function(){
    //     if($("input[type=radio][id=cbCorner]").val() == "on"){
    //         $("#top-painel").hide();
    //     }
    // });
});