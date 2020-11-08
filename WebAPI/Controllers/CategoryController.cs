using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System.Linq;
using System.IO;
using System.Collections;
using System.Collections.Generic;
using ReachUp;

namespace ReachUpWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private IHostingEnvironment _hostingEnvironment;

        [Obsolete]
        public CategoryController(IHostingEnvironment hostingEnvironment)
        {
            this._hostingEnvironment = hostingEnvironment;
        }

        [Authorize]
        [HttpGet("GetImage")]
        public async Task<IActionResult> GetImage(int id)
        {
           if (!string.IsNullOrWhiteSpace(id.ToString())) 
           {
              var image = System.IO.File.OpenRead(_hostingEnvironment.ContentRootPath + $"/App_Data/category/{id}.svg");
              return File(image, "image/svg+xml");
           }
           return BadRequest("Parameters are null");
        }

        [Authorize]
        [HttpGet]
        public async Task<IActionResult> Get(int id)
        {
            if (!string.IsNullOrWhiteSpace(id.ToString()))
                return Ok(await new Category().Get(id));
            return BadRequest("Parameters are null");
        }

        [Authorize]
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll()
        {
           return Ok(await new Category().GetAll());
        }

        [Authorize(Roles = "adm")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Category category)
        {
            if (category != null)
                return Ok(await category.Add());
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "adm")]
        [HttpPatch]
        public async Task<IActionResult> Patch([FromBody] Category category)
        {
            if (category != null)
                return Ok(await category.Update());
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles="adm")]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id)
        {
            if (!string.IsNullOrWhiteSpace(id.ToString()))
                return Ok(await new Category().Delete(id));
            return BadRequest("Parameters are null");
        }
    }
}