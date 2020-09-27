if(localStorage.getItem('jsonmodel') == null)
{
   localStorage.setItem('jsonmodel','{"shopping":"Praiamar Shopping","address":"R. Alexandre Martins, 80 - Aparecida, Santos - SP, 11025-202","floors":[{"locates":[{"id":0,"position":{"x":0,"y":0,"floor":0}}],"halls":[[]]}]}');
   clear();
}


var inDevelopment = true;

var hallColor = "#e3ff12";
var beaconColor = "#42ddf5";
var triBeaconColor = "#bd0000";
var IlocalColor = "#25a149";
var ElocalColor = "#03290e";



var mapJson = getJson();

var map = [];


var mapMarks = new Array(26);
for (var i = 0; i < mapMarks.length; i++) {
    mapMarks[i] = new Array(26);
}

var numbersOfRoutes = 0;
var squaresCount = 0;


var firstRender = true;

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

function hatchMap(){
    numbersOfRoutes = mapJson.floors[0].halls.length;
    log("ROUTES: " + numbersOfRoutes);

        for (let i = 0; i <  numbersOfRoutes; i++) {
            mapJson.floors[0].halls[i].forEach(element => {
            log(element);
                    $(document.getElementById(element["x"]+","+element["y"]+"")).css("background-color",  hallColor )

            });
            
        }
    
}

function log(m){
    inDevelopment == true ? console.log(m) : null;
}
function draw(obj){
    let  cbHall = $("#cbHall").prop("checked");
    let  cbBeacon = $("#cbBeacon").prop("checked");
    let  cbTriBeacon = $("#cbTriBeacon").prop("checked");
    let  cbILocal = $("#cbILocal").prop("checked");
    let  cbELocal = $("#cbELocal").prop("checked");

    cbHall == true ? setDraw(hallColor, obj) :
    cbBeacon == true ? setDraw(beaconColor, obj) : 
    cbTriBeacon == true ? setDraw(triBeaconColor, obj) :
    cbILocal == true ? setDraw(IlocalColor, obj) :
    cbELocal == true ? setDraw(ElocalColor, obj): null;
  
}

function setDraw(color, obj){
  
    var x = obj.id.split(',')[0];
    var y = obj.id.split(',')[1];

        if(mapMarks[x][y] == null){
            mapMarks[x][y] = true;
            map.push({"x":parseInt(x), "y":parseInt(y)});
            $(obj).css("background-color",color);
        }


}

function clearDraw(){
    map =[];
    $(".square").css("background-color","transparent");
    log("!MAP CLEANED!");
}
function addToJson(){
    log(map);
    mapJson.floors[0].halls.push(map);
    log(mapJson);
    setJson(JSON.stringify(mapJson));
    map = [];
}

function getJson(){
    return  JSON.parse(localStorage.getItem("json"));
}

function setJson(val){
    localStorage.setItem("json",val);
}

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



