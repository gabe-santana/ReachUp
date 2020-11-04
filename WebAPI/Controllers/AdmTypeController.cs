using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System.Security.Claims;
using ReachUp;

namespace ReachUpWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdmTypeController : ControllerBase
    {

        [Authorize(Roles = "adm, dev")]
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll()
        {
           return Ok(await new AdmType().GetAll());
        }

        [Authorize(Roles = "adm, dev")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] AdmType admType)
        {
            if (admType != null)
                return Ok(await admType.Add());
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "dev")]
        [HttpPatch]
        public async Task<IActionResult> Patch([FromBody] AdmType admType)
        {
            if (admType != null)
                return Ok(await admType.Update());
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "dev")]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id)
        {
            if (!string.IsNullOrWhiteSpace(id.ToString()))
                return Ok(await new AdmType().Delete(id));
            return BadRequest("Parameters are null");
        }
    }
}