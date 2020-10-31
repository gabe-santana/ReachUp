using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ReachUp;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

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

        /*[Authorize (Roles = "loj,adm")]
        [HttpPost]
        public async Task<IAsyncEnumerable<Task<IActionResult>>> Post([FromBody] Communique communique) 
        {
            if (communique != null)
            {
                var action = communique.Add();
                //List<Task<bool>> responses = new List<Task<bool>>();
                
                foreach (var task in action)
                {
                   yield return task;
                }
                yield break;
            }
        }*/

        //
<<<<<<< Updated upstream
        [Authorize (Roles = "loj,adm")]
        [HttpPost]
        /* This is an action in which none, only the first or both
        commands can work */
        public List<bool> Post([FromBody] Communique communique) 
        {
            if (communique != null)
            {
               return Steps(communique);
            }
            List<bool> result = new List<bool>();
            result.Add(false);
            return result;
        }
=======
        //[Authorize (Roles = "loj,adm")]
        //[HttpPost]
        //public List<Task<IActionResult>> Post([FromBody] Communique communique) 
        //{
        //    if (communique != null)
        //    {
        //        List<Task<IActionResult>> results = new List<Task<IActionResult>>();
        //        var action = communique.Add();
        //        //return Ok(Step(action));
        //    }
        //    //return BadRequest("Parameters are null");
        //}
>>>>>>> Stashed changes

        /* Accessing the amount of "bool" and its values,
        we can later interpret the action final result*/
        static List<bool> Steps(Communique communique)
        {
            List<bool> results = new List<bool>();
            foreach (bool task in communique.Add())
            {
               // Yield return returns here
               results.Add(task);
            } 
            return results;          
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