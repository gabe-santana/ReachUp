using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ReachUp;

namespace ReachUpWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        #region Actions

        [Authorize (Roles = "adm, dev")]
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll(string role)
        {
            if (!string.IsNullOrWhiteSpace(role))
                return  Ok(await new User().GetAll(role));
            return BadRequest("Parameters are null");
        }

        [Authorize]
        [HttpGet]
        public async Task<IActionResult> Get(string role, string email)
        {
            if (!string.IsNullOrWhiteSpace(email) 
                && !string.IsNullOrWhiteSpace(role)
               )
                return Ok(await new User().Get(role, email));
            return BadRequest("Parameters are null");
        }

        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] User user)
        {
            if (user != null)
                return Ok(await user.Add());
            return BadRequest("Parameters are null");
        }

        [Authorize]
        [HttpPatch]
        public async Task<IActionResult> Patch([FromBody] User user)
        {
            if (!user.Equals(null)) 
                if (HttpContextId.IsOwn(HttpContext, user.Email)) 
                    return Ok(await user.Update());
                else
                    return BadRequest("Request denied");
            return BadRequest("Parameters are null");
        }

        [Authorize]
        [HttpDelete]
        public async Task<IActionResult> Delete(string role, string email)
        {
            if (!string.IsNullOrWhiteSpace(email) 
                && !string.IsNullOrWhiteSpace(role)
               )
                if (HttpContextId.IsOwn(HttpContext, email))
                    return Ok(await new User().Delete(role, email));
                else
                    return BadRequest("Request denied");
            return BadRequest("Parameters are null");
        }
         
        #endregion 
    }
}