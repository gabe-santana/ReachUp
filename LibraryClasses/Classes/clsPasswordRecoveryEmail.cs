using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ReachUp
{
    static class clsPasswordRecoveryEmail
    {
        public static readonly string Name = "<h1>ReachUp! - Recuperação de senha</h1>";
        public static readonly string RecoveryPageURL = "https://reachup.com/recoveryPassword";
        public static readonly string Content = "é o seu código de verificação. <br> Entre no link abaixo e use-o para redefinir sua senha. <br> <strong>Não responda a este e-mail, ele foi enviado de forma automática</strong><br>";
    }
}