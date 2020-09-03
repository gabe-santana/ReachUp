using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ReachUp;

namespace ReachUpWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BeaconController : ControllerBase
    {

        [Authorize(Roles = "adm")]
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll(int type)
        {
            if (!string.IsNullOrWhiteSpace(type.ToString()))
                return Ok(await new Beacon().GetAll(type));
            return BadRequest("Parameters are null");
        }

        [Authorize]
        [HttpGet]
        public async Task<IActionResult> Get(string uuid)
        {
            if (!string.IsNullOrWhiteSpace(uuid))
                return Ok(await new Beacon().Get(uuid));
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "loj,adm")]
        [HttpPost]
        public async Task<IActionResult> Post(Beacon beacon)
        {
            if (beacon != null)
                return Ok(await beacon.Add());
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "loj,adm")]
        [HttpPatch]
        public async Task<IActionResult> Patch(Beacon beacon)
        {
            if (beacon != null)
                return Ok(await beacon.Update());
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "loj,adm")]
        [HttpGet]
        public async Task<IActionResult> Delete(string uuid)
        {
            if (!string.IsNullOrWhiteSpace(uuid))
                return Ok(await new Beacon().Delete(uuid));
            return BadRequest("Parameters are null");
        }
    }
}