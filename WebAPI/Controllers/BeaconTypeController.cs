using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ReachUp;

namespace ReachUpWebAPI.Controllers
{
    [EnableCors("CorsPolicy")]
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

        [Authorize(Roles = "adm, dev")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] BeaconType beaconType)
        {
            if (beaconType != null)
                return Ok(await beaconType.Add());
            return BadRequest("Parameters are null");
        }
    }
}