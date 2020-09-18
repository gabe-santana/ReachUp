using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ReachUp;

namespace ReachUpWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClientPreferenceController : ControllerBase
    {
        #region Actions

        //Actions dos quatro métodos criados
        [Authorize(Roles = "adm")]
        [HttpGet("Get")]
        public async Task<IActionResult> GetAll(string role) 
        {
            if (!string.IsNullOrWhiteSpace(role)) 
                return Ok(await new ClientPreference().GetAll());
            return BadRequest("Parameters are null");
        }


        [Authorize(Roles = "adm", "cli")]
        [HttpGet("Get")]
        public async Task<IActionResult> Get(string email) 
        {
            if (!string.IsNullOrWhiteSpace(email)) 
                return Ok(await new ClientPreference().Get(email));
            return BadRequest("Parameters are null");
        }


        [Authorize (Roles = "cli")]
        [HttpPut("Add")]
        public async Task<IActionResult> Add(string email)
        {
            if (!string.IsNullOrWhiteSpace(email))
                return  Ok(await new ClientPreference().Add(email));
            return BadRequest("Parameters are null");
        }

        [Authorize (Roles = "cli")]
        [HttpPatch("Update")]
        public async Task<IActionResult> Update(string email)
        {
            if (!string.IsNullOrWhiteSpace(email))
                return Ok(await new ClientPreference().Update(email));
            return BadRequest("Parameters are null");
        }

        [Authorize (Roles = "cli")]
        [HttpDelete("Delete")]
        public async Task<IActionResult> Update(string email)
        {
            if (!string.IsNullOrWhiteSpace(email))
                return Ok(await new ClientPreference().Delete(email));
            return BadRequest("Parameters are null");
        }         
        #endregion 
    }
}