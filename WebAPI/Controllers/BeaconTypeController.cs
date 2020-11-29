using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Cors;
using ReachUp;

namespace ReachUpWebAPI.Controllers
{
    [EnableCors("CorsPolicy")]
    [Route("api/[controller]")]
    [ApiController]
    public class BeaconTypeController : ControllerBase
    {
        // OK 
        //[Authorize(Roles = "adm, dev")]
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll()
        {
           return Ok(await new BeaconType().GetAll());
        }

        // OK 
        [Authorize(Roles = "dev")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] BeaconType beaconType)
        {
            if (beaconType != null)
                return Ok(await beaconType.Add());
            return BadRequest("Parameters are null");
        }

        // OK 
        [Authorize(Roles = "dev")]
        [HttpPatch]
        public async Task<IActionResult> Patch([FromBody] BeaconType beaconType)
        {
            if (beaconType != null)
                return Ok(await beaconType.Update());
            return BadRequest("Parameters are null");
        }

        // OK 
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