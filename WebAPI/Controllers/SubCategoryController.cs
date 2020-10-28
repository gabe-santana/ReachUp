using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ReachUp;

namespace ReachUpWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SubCategoryController : ControllerBase
    {

        [Authorize]
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll()
        {
           return Ok(await new SubCategory().GetAll());
        }

        [Authorize]
        [HttpGet("ByLocal")]
        public async Task<IActionResult> ByLocal(int local)
        {
            if (!string.IsNullOrWhiteSpace(local.ToString()))
                return Ok(await new SubCategory().ByLocal(local));
            return BadRequest("Parameters are null");
        }

        [Authorize]
        [HttpGet("ByCommunique")]
        public async Task<IActionResult> ByCommunique(int communique)
        {
            if (!string.IsNullOrWhiteSpace(communique.ToString()))
                return Ok(await new SubCategory().ByCommunique(communique));
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "adm")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] SubCategory subCategory)
        {
            if (subCategory != null)
                return Ok(await subCategory.Add());
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles="adm")]
        [HttpDelete]
        public async Task<IActionResult> Delete(int category, int subCategory)
        {
            if (!string.IsNullOrWhiteSpace(category.ToString()) 
                && !string.IsNullOrWhiteSpace(subCategory.ToString())
               )
                return Ok(await new SubCategory().Delete(category, subCategory));
            return BadRequest("Parameters are null");
        }
    }
}