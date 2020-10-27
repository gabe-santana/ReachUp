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

        [Authorize(Roles = "adm,cli")]
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll(string email) 
        {
            if (!string.IsNullOrWhiteSpace(email)) 
                return Ok(await new ClientPreference().GetAll(email));
            return BadRequest("Parameters are null");
        }

        [Authorize (Roles = "cli")]
        [HttpPost("Add")]
        public async Task<IActionResult> Add(string email, [FromBody] ClientPreference clientPreference)
        {
            if (!string.IsNullOrWhiteSpace(email) && clientPreference != null)
              return  Ok(await clientPreference.Add(email));
           return BadRequest("Parameters are null");
        }

        [Authorize (Roles = "cli")]
        [HttpDelete]
        public async Task<IActionResult> Delete(string email, int category, int subCategory)
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