$(()=>{
  
    $(".square").on("click", function(e) {
        draw(this);
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