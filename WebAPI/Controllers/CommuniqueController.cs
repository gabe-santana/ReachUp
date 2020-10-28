using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ReachUp;

namespace ReachUpWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CommuniqueController : ControllerBase
    {
        [Authorize(Roles = "cli")]
        [HttpGet("Receive")]
        public async Task<IActionResult> Receive([FromBody] User user, [FromQuery] int local) 
        {
            if (user != null && !string.IsNullOrWhiteSpace(local.ToString()))
                return Ok(await new Communique().Receive(user, local));
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "loj,adm,cli")]
        [HttpGet]
        public async Task<IActionResult> Get(int local) 
        {
            if (!string.IsNullOrWhiteSpace(local.ToString()))
                return Ok(await new Communique().Get(local));
            return BadRequest("Parameters are null");
        }

        [Authorize (Roles = "loj,adm")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Communique communique) 
        {
            if (communique != null)
                return Ok(await communique.Add());
            return BadRequest("Parameters are null");
        }

        [Authorize (Roles = "loj,adm")]
        [HttpPatch]
        public async Task<IActionResult> Patch([FromBody] Communique communique)
        {
            if (communique != null)
                //if (HttpContextId.IsOwn(HttpContext, communique.CommuniqueLocal.Admin.Email))
                   return Ok(await communique.Update());
           return BadRequest("Parameters are null");
        }

        [Authorize (Roles = "loj,adm")]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id) 
        {
            if (!string.IsNullOrWhiteSpace(id.ToString()))
                return Ok(await new Communique().Delete(id));
            return BadRequest("Parameters are null");
        }
    }
}