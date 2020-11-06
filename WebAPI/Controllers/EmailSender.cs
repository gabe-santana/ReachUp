using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ReachUp;
using MimeKit;
using MailKit.Net.Smtp;

namespace ReachUpWebAPI.Controllers
{
   /*public interface IEmailSender 
   {
      Task SendEmailAsync(Message message);
   }*/

   [Route("api/[controller]")]
   [ApiController]
   public class EmailSender : ControllerBase
   {
      private readonly ReachUp.EmailConfiguration _emailConfig;

      public EmailSender(ReachUp.EmailConfiguration emailConfig)
      {
          _emailConfig = emailConfig;
      }

      public async Task SendEmailAsync(Message message)
      {
          var emailMessage = CreateEmailMessage(message);
          await SendAsync(emailMessage);
      }

       [Authorize(Roles="cli,adm,loj")]
       [HttpPost("PostRecoverPasswordEmail")]
       public async Task PostRecoverPasswordEmail([FromBody] EmailConfiguration emailConfiguration)
       {
          var rng = new Random();
          var message = new Message(
             emailConfiguration.UserEmail, emailConfiguration.EmailName, emailConfiguration.EmailContent
          );

          await SendEmailAsync(message);
          
       }

       private MimeMessage CreateEmailMessage(Message message)
       {
          var emailMessage = new MimeMessage();
          emailMessage.From.Add(
             MailboxAddress.Parse(_emailConfig.From)
             );
         emailMessage.To.Add(message.To);
         emailMessage.Subject = message.Subject;
         emailMessage.Body = 
           new TextPart(
             MimeKit.Text.TextFormat.Text
         ) {Text = message.Content};

         return emailMessage;
       }

       private async Task SendAsync(MimeMessage mailMessage)
       {
          using (var client = new SmtpClient())
          {
             try 
             {
                await client.ConnectAsync(_emailConfig.SmtpServer, _emailConfig.Port, true);
                client.AuthenticationMechanisms.Remove("XOAUTH2");
                await client.AuthenticateAsync(_emailConfig.UserName, _emailConfig.Password);

                await client.SendAsync(mailMessage);
             }

             catch
             {
                throw;
             }

             finally
             {
                await client.DisconnectAsync(true);
                client.Dispose();
             }
          }
       }
    }
}