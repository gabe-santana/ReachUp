using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System.IO;
using System.Collections;
using System.Collections.Generic;
using ReachUp;

namespace ReachUpWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LocalController : ControllerBase
    {
        private readonly IWebHostEnvironment _environment;

        public LocalController(IWebHostEnvironment environment)
        {
            _environment = environment;
        }

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

        /*[Authorize]
        [HttpGet("ByBeacon")]
        public async Task<IActionResult> ByBeacon(string uuid)
        {
            if (!string.IsNullOrWhiteSpace(uuid))
                return Ok(await new Local().ByBeacon(uuid));
            return BadRequest("Parameters are null");
        }*/

        [Authorize]
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll(string type)
        {
            if (!string.IsNullOrWhiteSpace(type))
                return Ok(await new Local().GetAll(type));
            return BadRequest("Parameters are null");
        }

        [Authorize]
        [HttpGet("FetchOpHours")]
        public async Task<IActionResult> FetchOpHours(int local, int weekDay)
        {
            if (!string.IsNullOrWhiteSpace(local.ToString()) 
               && !string.IsNullOrWhiteSpace(weekDay.ToString())
               )
                return Ok(await new Local().FetchOpHours(local, weekDay));
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

        [Authorize]
        [HttpGet("GetImage")]
        public async Task<IActionResult> GetImage(int id)
        {
           if (!string.IsNullOrWhiteSpace(id.ToString())) 
           {
              using(FileStream fileStream = System.IO.File.OpenRead(
                     _environment.WebRootPath + $"/images/local/{id}.jpg"
                    )
                 )
              {
                 // ---- //
                 return Ok("await Imagem");
              }
           }
           return BadRequest("Parameters are null");
        }

        [Authorize]
        [HttpPost("UploadImage")]
        public async Task<string> UploadImage([FromForm] IFormFile file)
        {
            string validExtensions = "jpg, png, image/jpeg, image/png";

            if (file.Length > 0)
            {
               //string extension = Path.GetExtension(file.FileName);

              if (validExtensions.Contains(file.ContentType))
              {
                 //try
                 //{
                   if(!Directory.Exists(_environment.WebRootPath + "/images/local/"))
                   {
                       Directory.CreateDirectory(_environment.WebRootPath + "/images/local/");
                   }
                   else if (System.IO.File.Exists(_environment.WebRootPath + "/images/local/" + file.FileName))
                   {
                       System.IO.File.Delete(_environment.WebRootPath + "/images/local/" + file.FileName);
                   }

                   using (FileStream filestream = 
                            System.IO.File.Create(
                             _environment.WebRootPath + "/images/local" +
                             file.FileName
                             )
                         )
                    {
                       await file.CopyToAsync(filestream);
                       filestream.Flush();
                       return "Ok!";
                    }
                //}

               /*erro CS0119*/ 
                /*catch (Exception ex)
                {
                   return ex.ToString();
                }*/
              }
              return "Tipo de arquivo inválido!";
            }
            return "Falha no envio do arquivo!";
        }
        

        /*[Authorize(Roles = "adm")]
        [HttpPost("AddOpHours")]
        public async Task<IActionResult> AddOpHours([FromBody] Local local, [FromBody] OpeningHours openingHours) 
        {
            if (local != null && openingHours != null)
                return Ok(await local.AddOpHours());
            return BadRequest("Parameters are null");
        }*/


        [Authorize(Roles = "adm")]
        [HttpPatch]
        public async Task<IActionResult> Patch([FromBody] Local local)
        {
            if (local != null)
                return Ok(await local.Update());
            return BadRequest("Parameters are null");
        }


        [Authorize(Roles = "adm")]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id)
        {
            if (!string.IsNullOrWhiteSpace(id.ToString()))
                return Ok(await new Local().Delete(id));
            return BadRequest("Parameters are null");
        }

        /*[Authorize(Roles = "adm")]
        [HttpPost("AddSubCategories")]
        public async Task<IActionResult> AddSubCategories([FromBody] Local local) 
        {
            if (local != null)
                return Ok(await local.AddSubCategories());
            return BadRequest("Parameters are null");
        }*/

        [Authorize(Roles = "adm")]
        [HttpDelete("DeleteSubCategory")]
        public async Task<IActionResult> DeleteSubCategory(int local, int category, int subCategory)
        {
            if (!string.IsNullOrWhiteSpace(local.ToString()) 
                && !string.IsNullOrWhiteSpace(category.ToString()) 
                && !string.IsNullOrWhiteSpace(subCategory.ToString())
               )
                return Ok(await new Local().DeleteSubCategory(local, category, subCategory));
            return BadRequest("Parameters are null");
        }

        /*[Authorize(Roles = "adm")]
        [HttpGet("GetAdmins")]
        public async Task<IActionResult> GetAdmins(int local)
        {
            if (!string.IsNullOrWhiteSpace(local.ToString()))
                return Ok(await new Local().GetAdmins(local));
            return BadRequest("Parameters are null");
        }*/

        [Authorize(Roles = "adm")]
        [HttpPost("ConnectAdmin")]
        public async Task<IActionResult> ConnectAdmin(string email, int local) 
        {
            if (!string.IsNullOrWhiteSpace(email)
                && !string.IsNullOrWhiteSpace(local.ToString())
               )
                return Ok(await new Local().ConnectAdmin(email, local));
            return BadRequest("Parameters are null");
        }

        #endregion
    }
}