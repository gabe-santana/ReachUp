using System;
using System.Threading.Tasks;
using ReachUp;
using MimeKit;
using MailKit.Net.Smtp;

namespace ReachUp
{

   public class EmailSender
   {
      private readonly EmailConfiguration _emailConfig;

      public EmailSender(EmailConfiguration emailConfig)
      {
          _emailConfig = emailConfig;
      }

      public async Task<bool> SendEmailAsync(Message message)
      {
          var emailMessage = CreateEmailMessage(message);
          return await SendAsync(emailMessage) ? true : false;
      }

       public async Task<bool> PostRecoverPasswordEmail()
       {
          var rng = new Random();
          var message = new Message(
             _emailConfig.UserEmail, _emailConfig.EmailName, _emailConfig.EmailContent
          );
          
          return await SendEmailAsync(message) ? true : false;
          
       }

       private MimeMessage CreateEmailMessage(Message message)
       {
          var emailMessage = new MimeMessage();
          emailMessage.From.Add(
             MailboxAddress.Parse(clsEmailStaticConfigs.UserName)
             );
         emailMessage.To.Add(message.To);
         emailMessage.Subject = message.Subject;
         emailMessage.Body = 
           new TextPart(
             MimeKit.Text.TextFormat.Text
         ) {Text = message.Content};

         return emailMessage;
       }

       private async Task<bool> SendAsync(MimeMessage mailMessage)
       {
          using (var client = new SmtpClient())
          {
             try 
             {
                await client.ConnectAsync(clsEmailStaticConfigs.SmtpServer, clsEmailStaticConfigs.Port, true);
                client.AuthenticationMechanisms.Remove("XOAUTH2");
                await client.AuthenticateAsync(clsEmailStaticConfigs.UserName, clsEmailStaticConfigs.Password);

                await client.SendAsync(mailMessage);
             }

             catch
             {
                //throw;
                return false;
             }

             finally
             {
                await client.DisconnectAsync(true);
                client.Dispose();
             }
             return true;
          }
       }
    }
}