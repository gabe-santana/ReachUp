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
    public class LocalTypeController : ControllerBase
    {

        private IHostingEnvironment _hostingEnvironment;

        [Obsolete]
        public LocalTypeController(IHostingEnvironment hostingEnvironment)
        {
            this._hostingEnvironment = hostingEnvironment;
        }

        [Authorize(Roles = "adm, dev")]
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll()
        {
           return Ok(await new LocalType().GetAll());
        }

        [Authorize(Roles = "adm, dev")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] LocalType localType)
        {
            if (localType != null)
                return Ok(await localType.Add());
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "adm")]
        [HttpPatch]
        public async Task<IActionResult> Patch([FromBody] LocalType localType)
        {
            if (localType != null)
                return Ok(await localType.Update());
            return BadRequest("Parameters are null");
        }

        [Authorize(Roles = "adm")]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id)
        {
            if (!string.IsNullOrWhiteSpace(id.ToString()))
                return Ok(await new LocalType().Delete(id));
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
                 var image = System.IO.File.OpenRead(_hostingEnvironment.ContentRootPath + $"/App_Data/localType/{id}.png");
                 return File(image, "image/png");
              }

              catch
              {
                 return NotFound();
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
                   if(!Directory.Exists(_hostingEnvironment.ContentRootPath + "/App_Data/localType/"))
                   {
                       Directory.CreateDirectory(_hostingEnvironment.ContentRootPath + "/App_Data/localType/");
                   }
                   else if (System.IO.File.Exists(_hostingEnvironment.ContentRootPath + "/App_Data/localType/" + file.FileName))
                   {
                       System.IO.File.Delete(_hostingEnvironment.ContentRootPath + "/App_Data/localType/" + file.FileName);
                   }

                   using (FileStream filestream = 
                            System.IO.File.Create(
                             _hostingEnvironment.ContentRootPath + "/App_Data/localType/" +
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

        [Authorize]
        [HttpPost("UploadImages")]
        public async Task<string> UploadImages([FromForm] List<IFormFile> files)
        {
            List<string> validExtensions = new List<string>(
                new string[] { ".png" });

            foreach (var file in files)
            {
               if (file.Length > 0)
               {
                  string extension = Path.GetExtension(file.FileName);

                  if (validExtensions.Contains(extension))
                  {
                      try
                      {
                          if(!Directory.Exists(_hostingEnvironment.ContentRootPath + "/App_Data/localType/"))
                          {
                             Directory.CreateDirectory(_hostingEnvironment.ContentRootPath + "/App_Data/localType/");
                          }
                          else if (System.IO.File.Exists(_hostingEnvironment.ContentRootPath + "/App_Data/localType/" + file.FileName))
                          {
                             System.IO.File.Delete(_hostingEnvironment.ContentRootPath + "/App_Data/localType/" + file.FileName);
                          }

                          using (FileStream filestream = 
                                   System.IO.File.Create(
                                    _hostingEnvironment.ContentRootPath + "/App_Data/localType/" +
                                    file.FileName
                                   )
                                )
                          {
                              await file.CopyToAsync(filestream);
                              filestream.Flush();
                              continue;
                          }
                      }

                      catch (Exception ex)
                      {
                         return ex.ToString();
                      }
                  }
                  return $"Envio das imagens interrompido - Exceção na imagem {file.FileName}: Tipo de arquivo inválido!";
               }
               return $"Envio das imagens interrompido - Falha no envio da imagem {file.FileName}";
            }
            return "Tudo ok!";
        }


    }
}