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

        // OK 
        [Authorize(Roles = "cli")]
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll(string email)
        {
            if (!string.IsNullOrWhiteSpace(email))
                return Ok(await new ClientPreference().GetAll(email));
            return BadRequest("Parameters are null");
        }

        // OK 
        [Authorize(Roles = "cli")]
        [HttpPost("Add")]
        public async Task<IActionResult> Add([FromBody] ClientPreference clientPreference)
        {
            if (clientPreference != null)
                return Ok(await clientPreference.Add());
            return BadRequest("Parameters are null");
        }

        // OK
        [Authorize(Roles = "cli,adm")]
        [HttpDelete]
        public async Task<IActionResult> Delete([FromQuery] string email, [FromQuery] int category, [FromQuery]int subCategory)
        {
            if (!string.IsNullOrWhiteSpace(email)
                && !string.IsNullOrWhiteSpace(category.ToString())
                && !string.IsNullOrWhiteSpace(subCategory.ToString())
               )
                return Ok(await new ClientPreference().Delete(email, category, subCategory));
            return BadRequest("Parameters are null");
        }
        #endregion
    }
}