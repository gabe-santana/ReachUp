/// <reference path='../Controllers/MallPlanController.ts'/>

import { MallPlanController } from "../Controllers/MallPlanController";

var $id = document.getElementById.bind(document);

$(()=>{

    const mapHandler = new MallPlanController.clsMallPlanController();
    var map = mapHandler.getMap();
    console.log(map);
    setMapLength();
    renderMap();

    var clicked = false;
    var squares = document.querySelectorAll('.square');

    $id('widthUnits').value = getWidthUnits();

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

    $id("floor").change(function(){
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

    $id("addRoute").click(function(){
        addHallToJson();
    });

    $id("addLocal").click(function(){
        addLocaltoJson();
    });

    
    $id("addAll").click(function(){
        addAlltoJson();
    });

 

    $id("clear").click(function(){
        //if (pendingAdditions == 0){
           clear();
           this.disabled = true;
           $id('showMap').disabled = false;
           $id('floor').value = getCurrentFloor();
        /*} else {
            alert('Há alterações não adicionadas!');
        }*/
        
    });

    $id('showMap').click(function(){
        hatchMap();
        this.disabled = true;
        $id('clear').disabled = false;

    })

    $id('plan').change(() => {
      alert('imagem mudou!');
      var path = this.val();
      if (path.split('.').pop() == 'jpg' || 'jpeg' || 'png'){
        $id('mapContainer').style.setProperty('background-image', `url(../map/${path})`);
        document.location.reload();
        return;
      }
      alert('Tipo de arquivo inválido! Escolha um arquivo de imagem!');
    });

    /*$('#updateMap').click(function(){
        const mapHandler = new MallPlanController.clsMallPlanController();
        mapHandler.putMap();
    })*/
});