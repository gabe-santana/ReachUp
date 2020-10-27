using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ReachUp;

namespace ReachUpWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LocalController : ControllerBase
    {
        #region Actions
        [Authorize]
        [HttpGet("Connect")]
        public async Task<IActionResult> Connect(string uuid) 
        {
            if (!string.IsNullOrWhiteSpace(uuid))
                return Ok(await new Local().ConnectBeaconLocal(uuid));
            return BadRequest("Parameters are null");
        }

        [Authorize]
        [HttpGet("Search")]
        public async Task<IActionResult> Search(string s) 
        {
            if (!string.IsNullOrWhiteSpace(s))
                return Ok(await new Local().Search(s));
            return BadRequest("Parameters are null");
        }
        [Authorize]
        [HttpGet]
        public async Task<IActionResult> Get(int id)
        {
            if (!string.IsNullOrWhiteSpace(id.ToString()))
                return Ok(await new Local().Get(id));
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "adm")]
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll(string type)
        {
            if (!string.IsNullOrWhiteSpace(type.ToString()))
                return Ok(await new Local().GetAll(type));
            return BadRequest("Parameters are null");
        }

        [Authorize]
        [HttpGet("FetchOpHours")]
        public async Task<IActionResult> FetchOpHours(int localId, int weekDay)
        {
            if (!string.IsNullOrWhiteSpace(type.ToString()))
                return Ok(await new Local().FetchOpHours(localId, weekDay));
            return BadRequest("Parameters are null");
        }
        

        [Authorize(Roles = "adm")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Local local) 
        {
            if (local != null)
                return Ok(await local.Add());
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "adm")]
        [HttpPost("AddOpHours")]
        public async Task<IActionResult> AddOpHours(int localId, int weekDay, time opening, time closing) 
        {
            if (local != null)
                return Ok(await local.AddOpHours(localId, weekDay, opening, closing));
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "loj")]
        [HttpPatch]
        public async Task<IActionResult> Patch([FromBody] Local local)
        {
            if (local != null)
                return Ok(await local.Update());
            return BadRequest("Parameters are null");
        }


        [Authorize(Roles = "loj,adm")]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id)
        {
            if (!string.IsNullOrWhiteSpace(id.ToString()))
                return Ok(await new Local().Delete(id));
            return BadRequest("Parameters are null");
        }

        #endregion
    }
}