using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using ReachUp;
using System.IO;

namespace ReachUpWebAPI.Controllers
{
    [EnableCors("CorsPolicy")]
    [Route("api/[controller]")]
    [ApiController]
    public class MallPlan : ControllerBase
    {
        #region Fields
        private IConfiguration Config;
        #endregion

        #region Constructor
        public MallPlan(IConfiguration Config)
        {
            this.Config = Config;
        }
        #endregion

        #region Methods
        public async Task<bool> patchPlan([FromBody] json)
        {
           string path = Request.PhysicalApplicationPath + @"\App_Data\json\map\map.json";
           DirectoryInfo directory = new DirectoryInfo(path);
           
           if (File.Exists(path)){
               File.Delete(path);
               path = Path.Combine(path, 'map.json');
               File.Create(path).Close();

               TextWriter file = File.AppendText(path);
               file.WriteLine(json);
               file.Close();
               
               return Task.fromResult(true);
           }

           return Task.fromResult(false);
        }

        #endregion

        #region Actions
        [Authorize(Roles = "adm")]
        [HttpPatch("patchPlan")]
        public async Task<IActionResult> patchPlan([FromBody] json) 
        {
           return Ok(await new patchPlan());
        }
        #endregion
    }
}