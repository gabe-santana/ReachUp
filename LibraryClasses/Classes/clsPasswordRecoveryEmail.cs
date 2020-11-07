using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ReachUp
{
    static class clsPasswordRecoveryEmail
    {
        public static readonly string Name = "ReachUp! - Recuperação de senha";
        public static readonly string RecoveryPageURL = "https://reachup.com/recoveryPassword";
        public static readonly string Content = "é o seu código de verificação. Entre no link abaixo e use-o para redefinir sua senha. Não responda a este e-mail, ele foi enviado de forma automática";
    }
}