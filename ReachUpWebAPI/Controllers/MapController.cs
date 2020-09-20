using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ReachUp;

namespace ReachUpWebAPI
{
    [Route("api/[controller]")]
    [ApiController]
    public class MapController : ControllerBase
    {
        private readonly string MapJSon;

        [Obsolete]
        public MapController(IHostingEnvironment hostingEnvironment)
        {
            this.MapJSon = System.IO.File.ReadAllText(hostingEnvironment.ContentRootPath + "/App_Data/json/map/map.json"); ;
        }

        [HttpGet]
        public IActionResult Get()
        {
            return Ok(this.MapJSon);
        }
    }
}