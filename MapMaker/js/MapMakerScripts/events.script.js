$(()=>{

    var clicked = false;
    var squares = document.querySelectorAll('.square');

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
});