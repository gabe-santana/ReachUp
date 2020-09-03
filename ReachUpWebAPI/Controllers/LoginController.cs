using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using ReachUp;


namespace ReachUpWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        #region Fields
        private IConfiguration Config;
        #endregion

        #region Constructor
        public LoginController(IConfiguration Config)
        {
            this.Config = Config;
        }
        #endregion

        #region Actions
        [HttpGet]
        public async Task<IActionResult> Get([FromQuery] User user) 
        {
            if (user != null)
                if (user.Login()) 
                    return Ok(new { token = await GenerateJSONWebToken(user)});
                else
                    return NotFound();
            return BadRequest("Parameters are null");

        }
        #endregion

        #region Private Methods
        private Task<string> GenerateJSONWebToken(User user)
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
                Expires = DateTime.UtcNow.AddHours(2),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return Task.FromResult(tokenHandler.WriteToken(token));
    

        //var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(this.Config["Jwt:Key"]));
        //    var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

        //    var Claims = new Claim[]
        //    {
        //        new Claim(ClaimTypes.Role, user.Role),
        //        new Claim(JwtRegisteredClaimNames.Email, user.Email),
        //        new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
        //    };

        //    var token = new JwtSecurityToken(
        //        issuer: this.Config["Jwt:Issuer"],
        //        audience: this.Config["Jwt:Issuer"],
        //        Claims,
        //        expires: DateTime.Now.AddMinutes(120),
        //        signingCredentials: credentials
        //    );

        //    return new JwtSecurityTokenHandler().WriteToken(token);
        }
        #endregion
    }
}