using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ReachUp;

namespace ReachUpWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BeaconTypeController : ControllerBase
    {

        [Authorize(Roles = "adm, dev")]
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll()
        {
           return Ok(await new BeaconType().GetAll());
        }

        /*[Authorize(Roles = "dev")]
        [HttpGet]
        public async Task<IActionResult> Get(int id)
        {
           if (!string.IsNullOrWhiteSpace(id.ToString()))
               return Ok(await new BeaconType().Get(id));
           return BadRequest("Parameters are null");
        }*/

        [Authorize(Roles = "dev")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] BeaconType beaconType)
        {
            if (beaconType != null)
                return Ok(await beaconType.Add());
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "dev")]
        [HttpPatch]
        public async Task<IActionResult> Patch([FromBody] BeaconType beaconType)
        {
            if (beaconType != null)
                return Ok(await beaconType.Update());
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "dev")]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id)
        {
            if (!string.IsNullOrWhiteSpace(id.ToString()))
                return Ok(await new BeaconType().Delete(id));
            return BadRequest("Parameters are null");
        }
    }
}