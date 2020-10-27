using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ReachUp;

namespace ReachUpWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FeedbackTypeController : ControllerBase
    {

        [Authorize(Roles = "adm")]
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll()
        {
           return Ok(await new FeedbackType().GetAll());
        }

        [Authorize(Roles = "adm")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] FeedbackType feedbackType)
        {
            if (feedbackType != null)
                return Ok(await feedbackType.Add());
            return BadRequest("Parameters are null");
        }
    }
}