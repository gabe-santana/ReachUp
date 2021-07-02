using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Cors;
using ReachUp;

namespace ReachUpWebAPI
{
    [EnableCors("CorsPolicy")]
    [Route("api/[controller]")]
    [ApiController]
    public class MapController : ControllerBase
    {
        private string MapJSon;
        private IHostingEnvironment hostingEnvironment;

        [Obsolete]
        public MapController(IHostingEnvironment hostingEnvironment)
        {
            this.hostingEnvironment = hostingEnvironment;
            this.MapJSon = System.IO.File.ReadAllText(hostingEnvironment.ContentRootPath + "/App_Data/json/map/map.json");
        }
         
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(this.MapJSon);
        }

        [Authorize]
        [HttpPut]
        public IActionResult Put([FromBody] object mapJson) 
        {
            using (StreamWriter writer = 
                new StreamWriter(hostingEnvironment.ContentRootPath + "/App_Data/json/map/map.json"))
            {
                writer.Write(mapJson);
            }


            return Ok(true);
        }

    }
}