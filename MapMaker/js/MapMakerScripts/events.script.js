$(()=>{
<<<<<<< HEAD

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
=======
  
    $(".square").on("click", function(e) {
        draw(this);
>>>>>>> parent of 09f0e2f... Painting added! Now it's easy to edit the map
    });

    /*$('.square').mouseout(function(){
        clicked = false;
    })*/

    $("#floor").change(function(){
        var floor = this.value;

        if (floor == ""){
            this.value = 0;
            floor = 0;
        }
        //clearDraw();
        //clearArrays();
        clear();
        setCurrentFloor(floor);
        //hatchMap();
        renderMap();
    })

    $("#addRoute").click(function(){
        addHallToJson();
    });

    $("#addLocal").click(function(){
        addLocaltoJson();
    });

    $("#addTriBeacon").click(function(){
        addTriBeacontoJson();
    });
    
    $("#addAll").click(function(){
        addAlltoJson();
    });

    $("#clear").click(function(){
        if (pendingAdditions == 0){
           clear();
           this.disabled = true;
           document.getElementById('showMap').disabled = false;
           document.getElementById('floor').value = getCurrentFloor();
        } else {
            alert('Há alterações não adicionadas!');
        }
        
    });

    $('#showMap').click(function(){
        hatchMap();
        this.disabled = true;
        document.getElementById('clear').disabled = false;

    })
});