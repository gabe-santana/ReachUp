// Verifica se o localstorage está vazio e insere dados nele.
if(localStorage.getItem('jsonmodel') == null)
{
   localStorage.setItem('jsonmodel', '{"version":0.1,"shopping":"Praiamar Shopping","address":"R. Alexandre Martins, 80 - Aparecida, Santos - SP, 11025-202","metersByUnity":1,"widthUnits":200,"heightUnits":200,"floors":[{"locates":[],"halls":[]},{"locates":[],"halls":[]},{"locates":[],"halls":[]},{"locates":[],"halls":[]}]}');
   clear();
}

//Váriaveis globais
var inDevelopment = true;

var colors = {
    hallColor: "#e3ff12",
    beaconColor: "#42ddf5",
    cornerColor = "#d98f07",
    IlocalColor: "#25a149",
    ElocalColor: "#03290e"
}

var setDrawExecutions = 0,
    currentFloor = 0,
    pendingAdditions = 0;

function setCurrentFloor(floor) {
    currentFloor = parseInt(floor);

    try {
        isEmpty(mapJson.floors[floor]);
    } catch (error) {
        mapJson = getJson();
        mapJson.floors.push();
        setJson(JSON.stringify(mapJson));
    }
}

function getCurrentFloor(){ return currentFloor; }

var mapJson = getJson(),
    mapWidth = mapJson.widthUnits,
    mapHeight = mapJson.heightUnits;

document.documentElement.style.setProperty('--squarePerRow', getWidthUnits());

    function updateWidthUnits(value){
       document.documentElement.style.setProperty('--squarePerRow', value);
       mapWidth = value;
       //Alterar no json
       clear();
       mapJson = getJson();
       renderMap();
    }

var triBeaconsLimit = mapJson.triBeaconsPerFloor;

function getTriBeaconsLimit(){ return triBeaconsLimit; }
    
function getWidthUnits(){ return mapWidth; }
    
function getHeightUnits(){ return mapHeight; }
    
function getMetersByUnity(){ return mapJson.metersByUnity; }
    
var numbersOfRoutes = 0,
    squaresCount = 0,
    firstRender = true;

//Arrays globais que contém objetos do mapa
var map = [],
    Ilocalmap = [],
    Elocalmap = [],
    beaconmap = [],
    mapMarks = [];

/*var localPositions = [],
    triBeaconmap = [];*/

function getDirections() {
    var directions = [];

    if ($("#cbCornerUp").prop("checked")) {
        directions.push("up");
    }

    if ($("#cbCornerDown").prop("checked")) {
        directions.push("down");
    }

    if ($("#cbCornerRight").prop("checked")) {
        directions.push("right");
    }

    if ($("#cbCornerLeft").prop("checked")) {
        directions.push("left");
    }

    return directions;
}

function setMapLength(){
  mapMarks = new Array(mapWidth);
  for (var i = 0; i < mapMarks.length; i++) {
    mapMarks[i] = new Array(mapHeight);
  }
}

//Função que renderiza o mapa
function renderMap(){
    for (let y = 0; y < mapWidth; y++) {
       for (let x = 0; x < mapHeight; x++) {
            var square = document.createElement('div');
            square.setAttribute('class','square');
            square.setAttribute('id',x+","+y);
            $("#mapContainer").append(square);
       }
    }
    hatchMap();
}

//Função que faz o desenho inicial do mapa
function hatchMap(){
    numbersOfRoutes = mapJson.floors[currentFloor].halls.length;

    //hatch halls and corners

    mapJson.floors[currentFloor].halls.forEach(element => {
        log(element);
        if (element.cornerInfo.isCorner) {
            hatchCorners(document.getElementById(element.position["x"] + "," + element.position["y"]));
        }
        else {
            hatchHalls(document.getElementById(element.position["x"] + "," + element.position["y"]))
        }

    });

    //hatch Ilocates

    mapJson.floors[currentFloor].locates.forEach(element => {
        hatchILocates(document.getElementById(element.area["x0"] + "," + element.area["y0"]));
    });

    //hatch Elocates

    mapJson.floors[currentFloor].locates.forEach(element => {

        hatchELocates(document.getElementById(element.area["x"] + "," + element.area["y"]));
    });


    //hatch beacons

    mapJson.floors[currentFloor].locates.forEach(element => {

        hatchBeacons(document.getElementById(element.beacons.position.x + "," + element.beacons.position.y));
    });
  
    setDrawExecutions++;
}
//Função de log
function log(m){
    inDevelopment == true ? console.log(m) : null;
}

//Função que desenha na div passada pelo parâmetro
function draw(obj) {
    let cbHall = $("#cbHall").prop("checked");
    let cbCorner = $("#cbCorner").prop("checked");
    let cbBeacon = $("#cbBeacon").prop("checked");
    let cbILocal = $("#cbILocal").prop("checked");
    let cbELocal = $("#cbELocal").prop("checked");

    cbHall ? setDraw(colors.hallColor, obj, 'h') :
        cbCorner ? setDraw(colors.cornerColor, obj, 'c') :
            cbBeacon ? setDraw(colors.beaconColor, obj, 'b') :
                cbILocal ? setDraw(colors.IlocalColor, obj, 'il') :
                    cbELocal ? setDraw(colors.ElocalColor, obj, 'el') : null;

}

//Função que seta o obj que será desenhado, neste caso é o "Hall"

function hatchHalls(obj) {
    setHatch(hallColor, obj);
}

function hatchCorners(obj) {
    setHatch(cornerColor, obj);
}

function hatchILocates(obj) {
    setHatch(IlocalColor, obj);
}

function hatchELocates(obj) {
    setHatch(ElocalColor, obj);
}


function hatchBeacons(obj) {
    setHatch(beaconColor, obj);
}


function drawHalls(obj) {
    setDraw(hallColor, obj, 'h');
}

function hatchCorners(obj) {
    setDraw(cornerColor, obj, 'c');
}


//Função que seta o obj que será desenhado, neste caso é a "posição inicial do Local"
function drawILocates(obj) {
    setDraw(IlocalColor, obj, 'il');
}

//Função que seta o obj que será desenhado, neste caso é a "posição final do Local"
function drawELocates(obj) {
    setDraw(ElocalColor, obj, 'el');
}

//Função que seta o obj que será desenhado, neste caso é o "beacon do local"
function drawBeacons(obj) {
    setDraw(beaconColor, obj, 'b');
}



function setHatch(color, obj){
    $(obj).css("background-color",color);
}

//Faz o desenho propriamento dito e guarda nos arrays
function setDraw(color, obj, id) {

    var x = obj.id.split(',')[0];
    var y = obj.id.split(',')[1];

    if (mapMarks[x][y] == null) {
        mapMarks[x][y] = id;

        switch (id) {
            case 'h':
                map.push(
                    {
                        cornerInfo: {
                            isCorner: false,
                        }, position: { "x": parseInt(x), "y": parseInt(y), "floor": parseInt(currentFloor) }
                    });
                break;

            case 'c':
                map.push(
                    {
                        cornerInfo: {
                            isCorner: true,
                            directions: getDirections(),
                        }, position: { "x": parseInt(x), "y": parseInt(y), "floor": parseInt(currentFloor) }
                    });
                break;


            case 'il':
                Ilocalmap.push({ "x0": parseInt(x), "y0": parseInt(y), "floor": parseInt(currentFloor) });
                break;
            case 'el':
                Elocalmap.push({ "x": parseInt(x), "y": parseInt(y), "floor": parseInt(currentFloor) });
                break;
            case 'b':
                var uuid = document.getElementById('uuid').value;
                uuid == "" ? uuid = generateUUID() : $("#uuid").val();

                beaconmap.push({
                    uuid: uuid,
                    position: {
                        "x": parseInt(x), "y": parseInt(y), "floor": parseInt(currentFloor)
                    }
                });
                break;

            default:
                break;
        }
        $(obj).css("background-color", color);
        //pendingAdditions++;
    }
}

//Limpa tudo
function clearDraw(){
    map =[];
    $(".square").css("background-color","transparent");
    log("!MAP CLEANED!");
}

//Adiciona os corredores no json
function addHallToJson() {

    if (!isEmpty(map)) {

        map.forEach(element => {
            mapJson.floors[currentFloor].halls.push(element);
        });
        var stringJson = JSON.stringify(mapJson);

        var copyToClipBoard = document.getElementById("copyToClipBoard");
        copyToClipBoard.value = stringJson;
        copyToClipBoard.select();
        document.execCommand("Copy");

        setJson(stringJson);
        clearArrays();
    }

}

//Adiciona os locais no json
function addLocaltoJson() {

    for (let b = 0; b < beaconmap.length; b++) {

        mapJson.floors[currentFloor].locates.push({
            id: $("#localid").val(),
            beacons: {
                uuid: beaconmap[b].uuid,
                position: {
                    x: beaconmap[b].position.x,
                    y: beaconmap[b].position.y,
                    floor: beaconmap[b].position.floor
                },
            },

            area: {
                x0: Ilocalmap[b].x0,
                y0: Ilocalmap[b].y0,
                x: Elocalmap[b].x,
                y: Elocalmap[b].y
            }
        }
        );

    }
    setJson(JSON.stringify(mapJson));
    clearArrays();
}


//Adiciona todas as novas mudanças no mapa
function addAlltoJson(){
   addHallToJson();
   addLocaltoJson();
}

//Limpa arrays
function clearArrays(){
   map = [];
   Ilocalmap = [];
   Elocalmap = [];
   beaconmap = [];
}


//Pega o json
function getJson(){
    return JSON.parse(localStorage.getItem("json"));
}

//Define valor no json
function setJson(val){
    localStorage.setItem("json",val);
}

//Limpa json do localstorage
function clear(){
    localStorage.setItem("json",
        localStorage.getItem("jsonmodel")
    );

    setMapLength();
    clearDraw();
}


//Verifica se existe valor
function isEmpty(obj) {
    return Object.keys(obj).length === 0;
}

//Gera UUID aleatoriamente
function generateUUID() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
      var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
      return v.toString(16); 
    });
  }
  