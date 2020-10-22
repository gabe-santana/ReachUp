/// <reference path='../Controllers/MallPlanController.ts'/>

$(()=>{

    const mapHandler = new MallPlanController.clsMallPlanController();
    var map = mapHandler.getMap();
    console.log(map);
    setMapLength();
    renderMap();

    var clicked = false;
    var squares = document.querySelectorAll('.square');

    $('#widthUnits').value = getWidthUnits();

    /*$('#widthUnits').change(function(){
        var unitsValue = this.value; 
        updateWidthUnits(unitsValue);
    })*/

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
    });

    $("#addRoute").click(function(){
        addHallToJson();
    });

    $("#addLocal").click(function(){
        addLocaltoJson();
    });

    
    $("#addAll").click(function(){
        addAlltoJson();
    });

 

    $("#clear").click(function(){
        //if (pendingAdditions == 0){
           clear();
           this.disabled = true;
           document.getElementById('showMap').disabled = false;
           document.getElementById('floor').value = getCurrentFloor();
        /*} else {
            alert('Há alterações não adicionadas!');
        }*/
        
    });

    $('#showMap').click(function(){
        hatchMap();
        this.disabled = true;
        document.getElementById('clear').disabled = false;

    })

    /*$('#updateMap').click(function(){
        const mapHandler = new MallPlanController.clsMallPlanController();
        mapHandler.putMap();
    })*/
});