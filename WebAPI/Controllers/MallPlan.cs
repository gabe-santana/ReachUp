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
        public async Task<List<object>> getMallPlan()
        {
           //verificar no MapMaker se há uma nova versão da planta, e retornar todo o objeto JSON
        }

        #endregion

        #region Actions
        [Authorize(Roles = "cli")]
        [HttpGet("getMallPlan")]
        public async Task<IActionResult> Fetch() 
        {
           return Ok(await new getMallPlan());
        }
        #endregion
    }
}