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

        public static bool deleteFile(string path);

        #region Methods
        public async Task<<bool>> patchPlan()
        {
           if (File.Exists(@""))
        }

        #endregion

        #region Actions
        [Authorize(Roles = "adm")]
        [HttpPatch("patchPlan")]
        public async Task<IActionResult> patchPlan() 
        {
           return Ok(await new patchPlan());
        }
        #endregion
    }
}