using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using ReachUp;


namespace ReachUpWebAPI.Controllers
{
    [EnableCors("CorsPolicy")]
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        #region Fields
        private IConfiguration Config;
        #endregion

        #region Constructor
        public AccountController(IConfiguration Config)
        {
            this.Config = Config;
        }
        #endregion

        #region Actions

        [HttpGet("CheckEmail")]
        public async Task<IActionResult> CheckEmail(string email, string role)
        {
            if (!string.IsNullOrWhiteSpace(email)
                && !string.IsNullOrWhiteSpace(role)
               )
                return Ok(await new User().CheckEmail(email, role));
            return BadRequest("Parameters are null");
        }

        [HttpPost("SignUp")]
        public async Task<IActionResult> SignUp([FromBody] User user)
        {
            if (user != null)
                return Ok(await user.Add());
            return BadRequest("Parameters are null");
        }

        [HttpPost("SignIn")]
        public async Task<IActionResult> SignIn([FromBody] User user) 
        {
            if (user != null)
                if (user.Login()) 
                    return Ok(GenerateJSONWebToken(user));
                else
                    return NotFound();
            return BadRequest("Parameters are null");
        }

        //[Authorize(Roles="cli,loj,adm")]
        [HttpGet("RecoverPassword")]
        public async Task<IActionResult> RecoverPassword(string email)
        {
            if (!string.IsNullOrWhiteSpace(email))
                return Ok(await new User().RecoverPassword(email));
            return BadRequest("Parameters are null");
        }

        [HttpGet("SignOut")]
        public async Task<IActionResult> SignOut([FromQuery] User user)
        {
            if (user != null)
               return Ok(DiscardJSONWebToken(user));

            return BadRequest("Parameters are null");
        }
        #endregion

        #region Private Methods
        private User GenerateJSONWebToken(User user)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.UTF8.GetBytes(this.Config["Jwt:Key"]);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Email, user.Email),
                    new Claim(ClaimTypes.Role, user.Role)
                }),
                Expires = DateTime.UtcNow.AddDays(1),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            user.Token = tokenHandler.WriteToken(token);
            return user;

  
        }

        private bool DiscardJSONWebToken(User user)
        {
           //TODO
           return false;
        }
        #endregion
    }
}