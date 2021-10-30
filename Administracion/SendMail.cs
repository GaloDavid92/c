using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.IO;

namespace Administracion
{
    public class SendMail
    {
        string emisor;
        string password;

        public string Emisor { get => emisor; set => emisor = value; }
        public string Password { get => password; set => password = value; }

        public SendMail(string emisor, string password)
        {
            this.emisor = emisor;
            this.password = password;
        }

        public void sendMail(string destinatario, string asunto, string correo)
        {
            var fromAddress = new MailAddress(this.Emisor, "Coordinacion TIC");
            var toAddress = new MailAddress(destinatario);
            string fromPassword = this.Password;
            string subject = asunto;
            string body = correo;

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };
            
            var path = HttpContext.Current.Server.MapPath("~/images/bannerEPN.png");

            AlternateView imgView = AlternateView.CreateAlternateViewFromString("<img src=cid:imgpath height=200><br/>" + body, null, "text/html");
            LinkedResource resource = new LinkedResource(path);
            resource.ContentId = "imgpath";
            imgView.LinkedResources.Add(resource);

            var message = new MailMessage(fromAddress, toAddress);
            message.IsBodyHtml = true;
            message.Subject = subject;
            message.AlternateViews.Add(imgView);
            message.Body = resource.ContentId;

            smtp.Send(message);
            
            
            /*
            MailMessage msg = new MailMessage();
            //Quien escribe al correo
            msg.From = new MailAddress(emisor);
            //A quien va dirigido
            msg.To.Add(new MailAddress(destinatario));
            //Asunto
            msg.Subject = asunto;
            //Contenido del correo
            msg.Body = correo;
            //Servidor smtp de hotmail
            SmtpClient clienteSmtp = new SmtpClient();
            clienteSmtp.Host = "smtp.live.com";
            clienteSmtp.Port = 465;
            clienteSmtp.EnableSsl = false;
            clienteSmtp.UseDefaultCredentials = false;
            //Se envia el correo
            clienteSmtp.Credentials = new NetworkCredential(emisor, this.password);
            clienteSmtp.EnableSsl = true;
            try
            {
                clienteSmtp.Send(msg);
                Console.WriteLine("MEnsaje Enviado");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al enviar el correo " + ex.Message);
            }*/
        }
    }
}