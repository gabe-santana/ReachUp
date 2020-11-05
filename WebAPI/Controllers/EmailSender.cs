using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ReachUp;
using MailKit;
using MimeKit;
using MailKit.Net.Smtp;

namespace ReachUpWebAPI.Controllers
{

    public class EmailSender : ControllerBase
    {
       private readonly EmailConfig _emailConfig;

       public EmailSender(EmailConfig emailConfig)
       {
          _emailConfig = emailConfig;
       }

       public async Task SendEmailAsync(Message message)
       {
          var emailMessage = CreateEmailMessage(message);
          await SendAsync(emailMessage);
       }

       [Authorize(Roles="cli, adm, loj")]
       [HttpGet("GetRecoverPasswordEmail")]
       public async Task GetRecoverPasswordEmail(string userEmail, 
         string emailName, string emailContent)
       {
          var rng = new Random();
          var message = new Message(
             userEmail, emailName, emailContent
          );

          await _emailSender.SendEmailAsync(message);
          
       }

       private MimeMessage CreateEmailMessage(Message message)
       {
          var emailMessage = new MimeMessage();
          emailMessage.From.Add(
             new MailboxAddress(_emailConfig.From)
             );
         emailMessage.To.AddRange(message.To);
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