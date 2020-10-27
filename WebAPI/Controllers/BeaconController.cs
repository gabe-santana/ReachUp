using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ReachUp;

namespace ReachUpWebAPI.Controllers
{
    [EnableCors("CorsPolicy")]
    [Route("api/[controller]")]
    [ApiController]
    public class BeaconController : ControllerBase
    {

        [Authorize(Roles = "adm, dev")]
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll(int type)
        {
            if (!string.IsNullOrWhiteSpace(type.ToString()))
                return Ok(await new Beacon().GetAll(type));
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "adm,dev")]
        [HttpGet]
        public async Task<IActionResult> Get(string uuid)
        {
            if (!string.IsNullOrWhiteSpace(uuid))
                return Ok(await new Beacon().Get(uuid));
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "adm, dev")]
        [HttpGet("ByLocal")]
        public async Task<IActionResult> ByLocal(int local)
        {
            if (!string.IsNullOrWhiteSpace(local.ToString()))
                return Ok(await new Beacon().ByLocal(local));
            return BadRequest("Parameters are null");
        }


        [Authorize(Roles = "adm,dev")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Beacon beacon)
        {
            if (beacon != null)
                return Ok(await beacon.Add());
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "adm, dev")]
        [HttpPatch]
        public async Task<IActionResult> Patch([FromBody] Beacon beacon)
        {
            if (beacon != null)
                return Ok(await beacon.Update());
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "adm, dev")]
        [HttpDelete]
        public async Task<IActionResult> Delete(string uuid)
        {
            if (!string.IsNullOrWhiteSpace(uuid))
                return Ok(await new Beacon().Delete(uuid));
            return BadRequest("Parameters are null");
        }
    }
}