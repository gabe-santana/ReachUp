using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ReachUp;

namespace ReachUpWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FeedbackController : ControllerBase
    {
        [Authorize(Roles = "adm")]
        [HttpGet("ByDate")]
        public async Task<IActionResult> ByDate(int type, string begin, string end)
        {
            if (!string.IsNullOrWhiteSpace(type.ToString())
                && !string.IsNullOrWhiteSpace(begin)
                && !string.IsNullOrWhiteSpace(end)
               )
                return Ok(await new Feedback().ByDate(type,begin,end));
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "cli,adm")]
        [HttpGet("ByUser")]
        public async Task<IActionResult> ByUser(string email) 
        {
            if (!string.IsNullOrWhiteSpace(email))
                return Ok(await new Feedback().ByUser(email));
            return BadRequest("Parameters are null");
        }


        [Authorize(Roles = "adm")]
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll(int type)
        {
            if (!string.IsNullOrWhiteSpace(type.ToString()))
                return Ok(await new Feedback().GetAll(type));
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "adm,cli")]
        [HttpGet]
        public async Task<IActionResult> Get(int id, int type)
        {
            if (!string.IsNullOrWhiteSpace(id.ToString())
                && !string.IsNullOrWhiteSpace(type.ToString())
               )
                return Ok(await new Feedback().Get(id, type));
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "cli")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Feedback feedback) 
        {
            if (feedback != null)
                if (HttpContextId.IsOwn(HttpContext, feedback.FeedbackUser.Email))
                    return Ok(await feedback.Add());
            return BadRequest("Parameters are null");
        }


        [Authorize (Roles = "cli")]
        [HttpPatch]
        public async Task<IActionResult> Patch([FromBody] Feedback feedback) 
        {
            if (feedback != null)
                if (HttpContextId.IsOwn(HttpContext, feedback.FeedbackUser.Email))
                    return Ok(await feedback.Update());
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "adm")]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id)
        {
            if (!string.IsNullOrWhiteSpace(id.ToString()))
                return Ok(await new Feedback().Delete(id));
            return BadRequest("Parameters are null");
        }

        /*[Authorize(Roles = "adm")]
        [HttpGet("GetAverage")]
        public async Task<IActionResult> GetAverage(DateTime startDate, DateTime endDate, bool isGeneral)
        {
            if (!string.IsNullOrWhiteSpace(startDate.ToString())
                && !string.IsNullOrWhiteSpace(endDate.ToString())
                && !string.IsNullOrWhiteSpace(isGeneral.ToString())
               )
                return Ok(await new Feedback().GetAverage(startDate, endDate, isGeneral));
            return BadRequest("Parameters are null");
        }*/
    }
}