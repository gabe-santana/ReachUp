using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ReachUp;

namespace ReachUpWebAPI.Controllers
{
    [EnableCors("CorsPolicy")]
    [Route("api/[controller]")]
    [ApiController]
    public class LocalTypeController : ControllerBase
    {

        [Authorize(Roles = "adm, dev")]
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll()
        {
           return Ok(await new LocalType().GetAll());
        }

        [Authorize(Roles = "adm, dev")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] LocalType localType)
        {
            if (localType != null)
                return Ok(await localType.Add());
            return BadRequest("Parameters are null");
        }
    }
}