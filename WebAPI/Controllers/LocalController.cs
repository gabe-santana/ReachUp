using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System.Linq;
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
 
        private IHostingEnvironment _hostingEnvironment;

        [Obsolete]
        public LocalController(IHostingEnvironment hostingEnvironment)
        {
            this._hostingEnvironment = hostingEnvironment;
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

        [Authorize]
        [HttpGet("ByBeacon")]
        public async Task<IActionResult> ByBeacon(string uuid)
        {
            if (!string.IsNullOrWhiteSpace(uuid))
                return Ok(await new Local().ByBeacon(uuid));
            return BadRequest("Parameters are null");
        }

        [Authorize]
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll(int type)
        {
            if (!string.IsNullOrWhiteSpace(type.ToString()))
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

        [Authorize]
        [HttpDelete("DeleteOpHours")]
        public async Task<IActionResult> DeleteOpHours(int local, int weekDay)
        {
            if (!string.IsNullOrWhiteSpace(local.ToString()) 
               && !string.IsNullOrWhiteSpace(weekDay.ToString())
               )
                return Ok(await new Local().DeleteOpHours(local, weekDay));
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
              try 
              {
                 var image = System.IO.File.OpenRead(_hostingEnvironment.ContentRootPath + $"/App_Data/local/{id}.png");
                 return File(image, "image/png");
              }

              catch
              {
                 return NotFound("Imagem não encontrada");
              }
              
           }
           return BadRequest("Parameters are null");
        }

        [Authorize]
        [HttpPost("UploadImage")]
        public async Task<string> UploadImage([FromForm] IFormFile file)
        {
            List<string> validExtensions = new List<string>(
                new string[] { ".png" });

            if (file.Length > 0)
            {
               string extension = Path.GetExtension(file.FileName);

              if (validExtensions.Contains(extension))
              {
                 try
                 {
                   if(!Directory.Exists(_hostingEnvironment.ContentRootPath + "/App_Data/local/"))
                   {
                       Directory.CreateDirectory(_hostingEnvironment.ContentRootPath + "/App_Data/local/");
                   }
                   else if (System.IO.File.Exists(_hostingEnvironment.ContentRootPath + "/App_Data/local/" + file.FileName))
                   {
                       System.IO.File.Delete(_hostingEnvironment.ContentRootPath + "/App_Data/local/" + file.FileName);
                   }

                   using (FileStream filestream = 
                            System.IO.File.Create(
                             _hostingEnvironment.ContentRootPath + "/App_Data/local/" +
                             file.FileName
                             )
                         )
                    {
                       await file.CopyToAsync(filestream);
                       filestream.Flush();
                       return "Ok!";
                    }
                }

                catch (Exception ex)
                {
                   return ex.ToString();
                }
             }
              return "Tipo de arquivo inválido!";
            }
            return "Falha no envio do arquivo!";
        } 
        

        [Authorize(Roles = "adm")]
        [HttpPost("AddOpHours")]
        public async Task<IActionResult> AddOpHours([FromBody] Local local) 
        {
            if (local != null)
                return Ok(await local.AddOpHours());
            return BadRequest("Parameters are null");
        }


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