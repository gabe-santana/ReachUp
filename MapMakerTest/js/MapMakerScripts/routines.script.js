// Verifica se o localstorage está vazio e insere dados nele.
if(localStorage.getItem('jsonmodel') == null)
{
   localStorage.setItem('jsonmodel','{"version":0.1,"shopping":"Praiamar Shopping","address":"R. Alexandre Martins, 80 - Aparecida, Santos - SP, 11025-202","floors":[{"locates":[{"beacons":[{"uuid":"f7826da6-4fa2-4e98-8024-bc5b71e0893e","position":{"x":2,"y":3,"floor":0}}],"id":0,"position":{"x0":0,"y0":0,"x":5,"y":5,"floor":0}}],"halls":[[]], "triBeacons":[] }]}');
   clear();
}

var mapJson = getJson();

//Função que faz o desenho inicial do mapa
function hatchMap(){
    log(document.getElementById(mapJson.beacons[0].position.x+","+mapJson.beacons[0].position.y+""));
    log(document.getElementById(mapJson.triBeacons[0].position.x+","+mapJson.beacons[0].position.y+""));   
}
//Função de log
function log(m){
    inDevelopment == true ? console.log(m) : null;
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
  