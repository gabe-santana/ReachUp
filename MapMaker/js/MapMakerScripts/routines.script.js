// Verifica se o localstorage está vazio e insere dados nele.
if(localStorage.getItem('jsonmodel') == null)
{
   localStorage.setItem('jsonmodel','{"version":0.1,"shopping":"Praiamar Shopping","address":"R. Alexandre Martins, 80 - Aparecida, Santos - SP, 11025-202","floors":[{"locates":[{"beacons":[{"uuid":"f7826da6-4fa2-4e98-8024-bc5b71e0893e","position":{"x":2,"y":3,"floor":0}}],"id":0,"position":{"x0":0,"y0":0,"x":5,"y":5,"floor":0}}],"halls":[[]], "tribeacons":[] }]}');
   clear();
}

//Váriaveis globais
var inDevelopment = true;

var hallColor = "#e3ff12";
var beaconColor = "#42ddf5";
var triBeaconColor = "#bd0000";
var IlocalColor = "#25a149";
var ElocalColor = "#03290e";

var currentFloor = 0;

var mapJson = getJson();

var numbersOfRoutes = 0;
var squaresCount = 0;


var firstRender = true;


//Arrays globais que contém objetos do mapa
var map = [];

var Ilocalmap = [];

var Elocalmap = [];

var beaconmap = [];

var triBeaconmap = [];

//Representação dos desenhos do mapa
var mapMarks = new Array(26);
for (var i = 0; i < mapMarks.length; i++) {
    mapMarks[i] = new Array(26);
}


//Função que renderiza o mapa
function renderMap(){
    for (let y = 0; y < 26; y++) 
       for (let x = 0; x < 26; x++) {
            var square = document.createElement('div');
            square.setAttribute('class','square');
            square.setAttribute('id',x+","+y);
            $("#mapContainer").append(square);
       }
       hatchMap();
}

//Função que faz o desenho inicial do mapa
function hatchMap(){
    numbersOfRoutes = mapJson.floors[0].halls.length;
    log("ROUTES: " + numbersOfRoutes);
    //draw halls
    for (let i = 0; i <  numbersOfRoutes; i++) {
            mapJson.floors[0].halls[i].forEach(element => {
            log(element);
                drawHalls(document.getElementById(element["x"]+","+element["y"]+""))

            });
    }

    //draw Ilocates
   
    mapJson.floors[0].locates.forEach(element => {
        /*var banana = document.getElementById(element.position.x0+","+element.position.y0);
        var banana0 = "";
        if (banana){
        banana0 = banana.value;
      }*/
      drawILocates(document.getElementById(element.position["x0"]+","+element.position["y0"]+""));
    });

    //draw Elocates

    mapJson.floors[0].locates.forEach(element => {

        drawELocates(document.getElementById(element.position["x"]+","+element.position["y"]+""));
    });


    //draw beacons
  if (typeof mapJson.floors[0].locates != "undefined" && typeof mapJson.floors[0].locates != null){
    mapJson.floors[0].locates.forEach(element => {
      //if (typeof element.beacons != "undefined" && !Array.isArray(element.beacons)){
        element.beacons.forEach(elementBeacon => {
            log(elementBeacon);
            drawBeacons(document.getElementById(elementBeacon.position.x+","+elementBeacon.position.y+""));
        })
      //}
    });
  }

    // draw tri-beacons
    //if (typeof mapJson.floors[0].triBeacons != "undefined" && !Array.isArray(mapJson.floors[0].triBeacons)){
    mapJson.floors[0].triBeacons.forEach(triBeacon => {

        drawTriBeacons(document.getElementById(triBeacon.position.x+","+triBeacon.position.y+""));
    });
  //}
}
//Função de log
function log(m){
    inDevelopment == true ? console.log(m) : null;
}


//Função que desenha na div passada pelo parâmetro
function draw(obj){
    let  cbHall = $("#cbHall").prop("checked");
    let  cbBeacon = $("#cbBeacon").prop("checked");
    let  cbTriBeacon = $("#cbTriBeacon").prop("checked");
    let  cbILocal = $("#cbILocal").prop("checked");
    let  cbELocal = $("#cbELocal").prop("checked");

    cbHall == true ? setDraw(hallColor, obj, 'h') :
    cbBeacon == true ? setDraw(beaconColor, obj, 'b') : 
    cbTriBeacon == true ? setDraw(triBeaconColor, obj, 'tb') :
    cbILocal == true ? setDraw(IlocalColor, obj, 'il') :
    cbELocal == true ? setDraw(ElocalColor, obj,'el'): null;
  
}


//Função que seta o obj que será desenhado, neste caso é o "Hall"
function drawHalls(obj){
    setDraw(hallColor, obj, 'h');
}

//Função que seta o obj que será desenhado, neste caso é a "posição inicial do Local"
function drawILocates(obj){
    setDraw(IlocalColor, obj,'il');
}

//Função que seta o obj que será desenhado, neste caso é a "posição final do Local"
function drawELocates(obj){
    setDraw(ElocalColor, obj,'el');
}

//Função que seta o obj que será desenhado, neste caso é o "beacon do local"
function drawBeacons(obj){
    setDraw(beaconColor, obj,'b');
}

//Função que seta o obj que será desenhado, neste caso é o "beacon trilateral"
function drawTriBeacons(obj){
    setDraw(triBeaconColor, obj,'tb');
}

//Faz o desenho propriamento dito e guarda nos arrays
function setDraw(color, obj, id){
  
    if (obj != null){
    var x = obj.id.split(',')[0];
    var y = obj.id.split(',')[1];
    //ERROR 16:50
        if(mapMarks[x][y] == null){
            mapMarks[x][y] = id;
            log(id);
            switch (id) {
                case 'h':
                    map.push({"x":parseInt(x), "y":parseInt(y)});
                    break;
                case 'il':
                    Ilocalmap.push({"x0":parseInt(x), "y0":parseInt(y), "floor": parseInt(currentFloor)});
                    break;
                case 'el':
                    Elocalmap.push({"x":parseInt(x), "y":parseInt(y), "floor": parseInt(currentFloor)});
                    break;
                case 'b':
                    beaconmap.push({
                        uuid: generateUUID(),
                        position: {
                            "x":parseInt(x), "y":parseInt(y), "floor": parseInt(currentFloor)
                        }
                    });
                    break;
                case 'tb':
                    triBeaconmap.push({
                    uuid: generateUUID(),
                    position: {
                            "x":parseInt(x), "y":parseInt(y), "floor": parseInt(currentFloor)
                        }});
                    break;
    
                default:
                    break;
            }
            $(obj).css("background-color",color);
        }
    }
}

//Limpa tudo
function clearDraw(){
    map =[];
    $(".square").css("background-color","transparent");
    log("!MAP CLEANED!");
}

//Adiciona os corredores no json
function addHallToJson(){
 
    if(!isEmpty(map)){
        mapJson.floors[currentFloor].halls.push(map);
        
        setJson(JSON.stringify(mapJson));
        clearArrays();
    }

}

//Adiciona os locais no json
function addLocaltoJson(){
    for (let b = 0; b < beaconmap.length; b++) {
        for (let i = 0; i < Ilocalmap.length; i++) {
            mapJson.floors[currentFloor].locates.push({
                beacons: {
                    uuid: beaconmap[b].uuid,
                    position:{
                        x: beaconmap[b].position.x,
                        y: beaconmap[b].position.y
                    },
                },
                    id: 0,
                    position: {
                        x0:Ilocalmap[i].x0,
                        y0:Ilocalmap[i].y0,
                        x: Elocalmap[i].x,
                        y: Elocalmap[i].y
                    }
                }
            );
        }
    }
    setJson(JSON.stringify(mapJson));
    clearArrays();
}

//Adiciona os tri-beacons no json
function addTriBeacontoJson(){
    if (typeof triBeaconmap != "undefined"){
    for (let tb = 0; tb < triBeaconmap.length; tb++) {
        if (typeof mapJson.floors[currentFloor].triBeacons != "undefined"){
        mapJson.floors[currentFloor].triBeacons.push({
            uuid: triBeaconmap[tb].uuid,
            position:{
                x: beaconmap[tb].position.x,
                y: beaconmap[tb].position.y
            },
        });
      }
    }
}
    setJson(JSON.stringify(mapJson));
    clearArrays();
}

//Limpa arrays
function clearArrays(){
   map = [];
   Ilocalmap = [];
   Elocalmap = [];
   beaconmap = [];
   triBeaconmap = [];
}


//Pega o json
function getJson(){
    var object = [];
    try{
      object = JSON.parse(localStorage.getItem("json"));
    }
    catch{
      object = undefined;
      log("undefined!");
    }
    return object;
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

    mapMarks = new Array(26);
    for (var i = 0; i < mapMarks.length; i++) {
        mapMarks[i] = new Array(26);
    }
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
  