$document.ready(function(){

    let clsMapRepository = class {
       constructor (){
           const ReachUpWebAPI;
           ReachUpWebAPI = new clsReachUpWebAPI();
        }

        getJson() {
            var contentRootPath = _hostingEnvironment.ContentRootPath;
            var JSON = System.IO.File.ReadAllText(contentRootPath + '/App_Data/json/map/map.json');
            return JSON;
        }
    } 

    const MapRepository;
    MapRepository = new clsMapRepository("");

})