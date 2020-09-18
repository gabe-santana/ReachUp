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
using ReachUpWebAPI.MapModels;

namespace ReachUpWebAPI
{
    [Route("api/[controller]")]
    [ApiController]
    public class MapController : ControllerBase
    {

        private readonly IHostingEnvironment _hostingEnvironment;

        public MapController(IHostingEnvironment hostingEnvironment)
        {
            _hostingEnvironment = hostingEnvironment;
        }

        [HttpGet("GetJson")]
        public IActionResult GetJson()
        {
            string contentRootPath = _hostingEnvironment.ContentRootPath;
            var JSON = System.IO.File.ReadAllText(contentRootPath + "/App_Data/json/map/map.json");
            return Ok(JSON);
        }
    }
}