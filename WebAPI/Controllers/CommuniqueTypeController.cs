using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ReachUp;

namespace ReachUpWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CommuniqueTypeController : ControllerBase
    {

        [Authorize(Roles = "adm, dev")]
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll()
        {
           return Ok(await new CommuniqueType().GetAll());
        }

        [Authorize(Roles = "adm, dev")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] CommuniqueType communiqueType)
        {
            if (communiqueType != null)
                return Ok(await communiqueType.Add());
            return BadRequest("Parameters are null");
        }
    }
}