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
    public class SubCategoryController : ControllerBase
    {
        private IHostingEnvironment _hostingEnvironment;

        [Obsolete]
        public SubCategoryController(IHostingEnvironment hostingEnvironment)
        {
            this._hostingEnvironment = hostingEnvironment;
        }

        // OK 
        [Authorize]
        [HttpGet("GetImage")]
        public async Task<IActionResult> GetImage(int categoryId, int subCategoryId)
        {
           if (!string.IsNullOrWhiteSpace(categoryId.ToString())
              && !string.IsNullOrWhiteSpace(subCategoryId.ToString()) 
              ) 
           {
              try 
              {
                  var image = System.IO.File.OpenRead(_hostingEnvironment.ContentRootPath + $"/App_Data/subCategory/{categoryId}_{subCategoryId}.svg");
                  return File(image, "image/svg+xml");
              }
              catch
              {
                  return NotFound("Ícone não encontrado");
              }
           }
           return BadRequest("Parameters are null");
        }

        // OK 
        [Authorize]
        [HttpPost("UploadImage")]
        public async Task<string> UploadImage([FromForm] IFormFile file)
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
                   if(!Directory.Exists(_hostingEnvironment.ContentRootPath + "/App_Data/subCategory/"))
                   {
                       Directory.CreateDirectory(_hostingEnvironment.ContentRootPath + "/App_Data/subCategory/");
                   }
                   else if (System.IO.File.Exists(_hostingEnvironment.ContentRootPath + "/App_Data/subCategory/" + file.FileName))
                   {
                       System.IO.File.Delete(_hostingEnvironment.ContentRootPath + "/App_Data/subCategory/" + file.FileName);
                   }

                   using (FileStream filestream = 
                            System.IO.File.Create(
                             _hostingEnvironment.ContentRootPath + "/App_Data/subCategory/" +
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

        // OK 
        [Authorize]
        [HttpPost("UploadImages")]
        public async Task<string> UploadImages([FromForm] List<IFormFile> files)
        {
            List<string> validExtensions = new List<string>(
                new string[] { ".svg" });

            foreach (var file in files)
            {
               if (file.Length > 0)
               {
                  string extension = Path.GetExtension(file.FileName);

                  if (validExtensions.Contains(extension))
                  {
                      try
                      {
                          if(!Directory.Exists(_hostingEnvironment.ContentRootPath + "/App_Data/subCategory/"))
                          {
                             Directory.CreateDirectory(_hostingEnvironment.ContentRootPath + "/App_Data/subCategory/");
                          }
                          else if (System.IO.File.Exists(_hostingEnvironment.ContentRootPath + "/App_Data/subCategory/" + file.FileName))
                          {
                             System.IO.File.Delete(_hostingEnvironment.ContentRootPath + "/App_Data/subCategory/" + file.FileName);
                          }

                          using (FileStream filestream = 
                                   System.IO.File.Create(
                                    _hostingEnvironment.ContentRootPath + "/App_Data/subCategory/" +
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
                  return $"Envio dos ícones interrompido - Exceção no ícone {file.FileName}: Tipo de arquivo inválido!";
               }
               return $"Envio dos ícones interrompido - Falha no envio do ícone {file.FileName}";
            }
            return "Tudo ok!";
        }

        // OK 
        [Authorize]
        [HttpGet("ByCategory")]
        public async Task<IActionResult> ByCategory(int category)
        {
            if (!string.IsNullOrWhiteSpace(category.ToString()))
                return Ok(await new SubCategory().ByCategory(category));
            return BadRequest("Parameters are null");
        }

        // OK 
        [Authorize]
        [HttpGet("ByLocal")]
        public async Task<IActionResult> ByLocal(int local)
        {
            if (!string.IsNullOrWhiteSpace(local.ToString()))
                return Ok(await new SubCategory().ByLocal(local));
            return BadRequest("Parameters are null");
        }

        // OK 
        [Authorize]
        [HttpGet("ByCommunique")]
        public async Task<IActionResult> ByCommunique(int communique)
        {
            if (!string.IsNullOrWhiteSpace(communique.ToString()))
                return Ok(await new SubCategory().ByCommunique(communique));
            return BadRequest("Parameters are null");
        }

        // OK 
        [Authorize(Roles = "adm")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] SubCategory subCategory)
        {
            if (subCategory != null)
                return Ok(await subCategory.Add());
            return BadRequest("Parameters are null");
        }

        // OK 
        [Authorize(Roles="adm")]
        [HttpDelete]
        public async Task<IActionResult> Delete(int category, int subCategory)
        {
            if (!string.IsNullOrWhiteSpace(category.ToString()) 
                && !string.IsNullOrWhiteSpace(subCategory.ToString())
               )
                return Ok(await new SubCategory().Delete(category, subCategory));
            return BadRequest("Parameters are null");
        }
    }
}