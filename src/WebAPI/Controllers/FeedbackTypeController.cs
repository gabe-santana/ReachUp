using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Cors;
using System.Linq;
using System.IO;
using System.Collections;
using System.Collections.Generic;
using ReachUp;

namespace ReachUpWebAPI.Controllers
{
    [EnableCors("CorsPolicy")]
    [Route("api/[controller]")]
    [ApiController]
    public class FeedbackTypeController : ControllerBase
    {
    
        private IHostingEnvironment _hostingEnvironment;

        [Obsolete]
        public FeedbackTypeController(IHostingEnvironment hostingEnvironment)
        {
            this._hostingEnvironment = hostingEnvironment;
        }

        // OK 
        //[Authorize(Roles = "adm, dev")]
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll()
        {
           return Ok(await new LocalType().GetAll());
        }

        // OK 
        //[Authorize(Roles = "adm, dev")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] LocalType feedbackType)
        {
            if (feedbackType != null)
                return Ok(await feedbackType.Add());
            return BadRequest("Parameters are null");
        }

        // OK 
        //[Authorize(Roles = "adm")]
        [HttpPatch]
        public async Task<IActionResult> Patch([FromBody] LocalType feedbackType)
        {
            if (feedbackType != null)
                return Ok(await feedbackType.Update());
            return BadRequest("Parameters are null");
        }

        // OK 
        //[Authorize(Roles = "adm")]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id)
        {
            if (!string.IsNullOrWhiteSpace(id.ToString()))
                return Ok(await new LocalType().Delete(id));
            return BadRequest("Parameters are null");
        }

        // OK 
        //[Authorize]
        [HttpGet("GetImage")]
        public async Task<IActionResult> GetImage(int id)
        {
           if (!string.IsNullOrWhiteSpace(id.ToString())) 
           {
              try 
              {
                 var image = System.IO.File.OpenRead(_hostingEnvironment.ContentRootPath + $"/App_Data/feedbackType/{id}.png");
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
        [Authorize]
        [HttpPost("UploadImage")]
        public async Task<bool> UploadImage([FromForm] IFormFile file)
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
                   if(!Directory.Exists(_hostingEnvironment.ContentRootPath + "/App_Data/feedbackType/"))
                       Directory.CreateDirectory(_hostingEnvironment.ContentRootPath + "/App_Data/feedbackType/");

                   else if (System.IO.File.Exists(_hostingEnvironment.ContentRootPath + "/App_Data/feedbackType/" + file.FileName))
                       System.IO.File.Delete(_hostingEnvironment.ContentRootPath + "/App_Data/feedbackType/" + file.FileName);

                   using (FileStream filestream = 
                            System.IO.File.Create(
                             _hostingEnvironment.ContentRootPath + "/App_Data/feedbackType/" +
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
                new string[] { ".png" });

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
                              if (!Directory.Exists(_hostingEnvironment.ContentRootPath + "/App_Data/feedbackType/"))
                                   Directory.CreateDirectory(_hostingEnvironment.ContentRootPath + "/App_Data/feedbackType/");
                          }
                          
                          if (System.IO.File.Exists(_hostingEnvironment.ContentRootPath + "/App_Data/feedbackType/" + file.FileName))
                               System.IO.File.Delete(_hostingEnvironment.ContentRootPath + "/App_Data/feedbackType/" + file.FileName);

                          using (FileStream filestream = 
                                   System.IO.File.Create(
                                    _hostingEnvironment.ContentRootPath + "/App_Data/feedbackType/" +
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

    }
}