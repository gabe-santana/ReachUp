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
using Microsoft.AspNetCore.Cors;
using ReachUp;

namespace ReachUpWebAPI.Controllers
{
    [EnableCors("CorsPolicy")]
    [Route("api/[controller]")]
    [ApiController]
    public class BoxController : ControllerBase
    {
        #region Actions

        //[Authorize(Roles="dev,adm")]
        [HttpGet("ByLocal")]
        public async Task<IActionResult> ByLocal(int local)
        {
            if (!string.IsNullOrWhiteSpace(local.ToString()))
              return Ok(await new Box().GetByLocal(local));
            return BadRequest("Parameters are null");
        }

        //[Authorize(Roles="dev")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Box box)
        {
            if (box != null)
              return Ok(await box.Add());
            return BadRequest("Parameters are null");
        }

        //[Authorize(Roles="dev,adm")]
        [HttpPatch]
        public async Task<IActionResult> Patch([FromBody] Box box)
        {
             if (box != null)
              return Ok(await box.Update());
            return BadRequest("Parameters are null");
        }

        //[Authorize(Roles="dev")]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id)
        {
            if (!string.IsNullOrWhiteSpace(id.ToString()))
              return Ok(await new Box().Delete(id));
            return BadRequest("Parameters are null");
        }
        #endregion
    }
}
