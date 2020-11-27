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
    public class CommuniqueController : ControllerBase
    {
        private IHostingEnvironment _hostingEnvironment;

        [Obsolete]
        public CommuniqueController(IHostingEnvironment hostingEnvironment)
        {
            this._hostingEnvironment = hostingEnvironment;
        }

        // OK, melhorar (trazer apenas as subcategorias que são preferências do cliente)
        // "Problema" de datas null 
        //[Authorize(Roles = "cli")]
        [HttpGet("Receive")]
        public async Task<IActionResult> Receive(string email, int local) 
        {
            if (!string.IsNullOrWhiteSpace(email)
                && !string.IsNullOrWhiteSpace(local.ToString()))
                return Ok(await new Communique().Receive(email, local));
            return BadRequest("Parameters are null");
        }

        // OK 
        //[Authorize(Roles = "loj,adm,cli")]
        [HttpGet]
        public async Task<IActionResult> Get(int local) 
        {
            if (!string.IsNullOrWhiteSpace(local.ToString()))
                return Ok(await new Communique().Get(local));
            return BadRequest("Parameters are null");
        }



        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll(int local, bool general)
        {
            if (!string.IsNullOrWhiteSpace(local.ToString()) && !string.IsNullOrWhiteSpace(general.ToString()))
                return Ok(await new Communique().GetAll(local, general));
            return BadRequest("Parameters are null");
        }


        //[Authorize(Roles = "loj")]
        [HttpGet("GetLocalDirectedPromotions")]
        public async Task<IActionResult> GetLocalDirectedPromotions(int local)
        {
            if (!string.IsNullOrWhiteSpace(local.ToString()))
                return Ok(await new Communique().GetLocalDirectedPromotions(local));
            return BadRequest("Parameters are null");
        }

        //[Authorize(Roles="loj")]
        [HttpGet("GetLocalCommuniqueHistory")]
        public async Task<IActionResult> GetLocalCommuniqueHistory(int local, bool isGeneral)
        {
            if (!string.IsNullOrWhiteSpace(local.ToString())
                && !string.IsNullOrWhiteSpace(isGeneral.ToString()))
                return Ok(await new Communique().GetLocalCommuniqueHistory(local, isGeneral));
            return BadRequest("Parameters are null");
        }

        // OK 
        [Authorize]
        [HttpGet("GetImage")]
        public async Task<IActionResult> GetImage(int id)
        {
           if (!string.IsNullOrWhiteSpace(id.ToString())) 
           {
              try 
              {
                  var image = System.IO.File.OpenRead(_hostingEnvironment.ContentRootPath + $"/App_Data/communique/{id}.png");
                  return File(image, "image/png");
              }
              catch
              {
                  return NotFound();
              }
           }
           return BadRequest("Parameters are null");
        }

        // OK 
        //[Authorize (Roles = "loj,adm")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Communique communique) 
        {
            if (communique != null)
               return Ok(await communique.Add());
           return BadRequest("Parameters are null");
        }

        // OK 
        /*[HttpPost("BindSubCategories")]
        public async Task<IActionResult> BindSubCategories([FromBody] Communique communique) 
        {
            if (communique != null)
               return Ok(await communique.BindSubCategories());
           return BadRequest("Parameters are null");
        }*/

        // OK 
        [Authorize]
        [HttpPost("UploadImage")]
        public async Task<bool> UploadImage([FromForm] IFormFile file)
        {
            List<string> validExtensions = new List<string>(
                new string[] { ".svg" });

            if (file.Length > 0)
            {
               string extension = Path.GetExtension(file.FileName);

              if (validExtensions.Contains(extension))
              {
                 try
                 {
                   if(!Directory.Exists(_hostingEnvironment.ContentRootPath + "/App_Data/communique/"))
                       Directory.CreateDirectory(_hostingEnvironment.ContentRootPath + "/App_Data/communique/");

                   else if (System.IO.File.Exists(_hostingEnvironment.ContentRootPath + "/App_Data/communique/" + file.FileName))
                       System.IO.File.Delete(_hostingEnvironment.ContentRootPath + "/App_Data/communique/" + file.FileName);

                   using (FileStream filestream = 
                            System.IO.File.Create(
                             _hostingEnvironment.ContentRootPath + "/App_Data/communique/" +
                             file.FileName
                             )
                         )
                    {
                       await file.CopyToAsync(filestream);
                       filestream.Flush();
                       return true;
                    }
                }

                catch
                {
                   return false;
                }
              }
              return false;
            }
            return false;
        } 

        // OK 
        [Authorize]
        [HttpPost("UploadImages")]
        public async Task<bool> UploadImages([FromForm] List<IFormFile> files)
        {
            List<string> validExtensions = new List<string>(
                new string[] { ".svg" });

            int i = -1;
            foreach (var file in files)
            {
               if (file.Length > 0)
               {
                  string extension = Path.GetExtension(file.FileName);

                  if (validExtensions.Contains(extension))
                  {
                      try
                      {
                          i++;

                          if (i == 0)
                          {
                              if(!Directory.Exists(_hostingEnvironment.ContentRootPath + "/App_Data/communique/"))
                                  Directory.CreateDirectory(_hostingEnvironment.ContentRootPath + "/App_Data/communique/");
                          }
                      
                          if (System.IO.File.Exists(_hostingEnvironment.ContentRootPath + "/App_Data/communique/" + file.FileName))
                               System.IO.File.Delete(_hostingEnvironment.ContentRootPath + "/App_Data/communique/" + file.FileName);

                          using (FileStream filestream = 
                                   System.IO.File.Create(
                                    _hostingEnvironment.ContentRootPath + "/App_Data/communique/" +
                                    file.FileName
                                   )
                                )
                          {
                              await file.CopyToAsync(filestream);
                              filestream.Flush();
                              continue;
                          }
                      }

                      catch
                      {
                         continue;
                      }
                  }
                  continue;
               }
               continue;
            }
            return true;
        }

        // OK 
        [HttpDelete("DisbindSubCategories")]
        public async Task<IActionResult> DisbindSubCategories([FromBody] Communique communique) 
        {
            if (communique != null)
               return Ok(await communique.DisbindSubCategories());
           return BadRequest("Parameters are null");
        }

        // OK 
        [Authorize (Roles = "loj,adm")]
        [HttpPatch]
        public async Task<IActionResult> Patch([FromBody] Communique communique)
        {
            if (communique != null)
                //if (HttpContextId.IsOwn(HttpContext, communique.CommuniqueLocal.Admin.Email))
                   return Ok(await communique.Update());
           return BadRequest("Parameters are null");
        }

        // isso está sendo autorizado mesmo sem o parâmetro de tipo
        //[Authorize (Roles = "loj,adm")]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id, int type) 
        {
            if (!string.IsNullOrWhiteSpace(id.ToString())
                && !string.IsNullOrWhiteSpace(type.ToString()))
                {
                    return Ok(await new Communique().Delete(id, type));
                }
            return BadRequest("Parameters are null");
        }
    }
}