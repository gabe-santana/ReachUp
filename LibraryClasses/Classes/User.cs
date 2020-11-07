using System.Collections.Generic;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System;

namespace ReachUp
{
    public class User : clsDatabase
    {
        #region Properties
        public string Email { get; set; }
        public string Name { get; set; }
        [JsonIgnore] public string Password { get; set; }
        public string Role{ get; set; }
        public Local AdmLocal { get; set; }
        public string Token { get; set; }
        public string AdmType { get; set; }

        #endregion


        #region Fields    
        private MySqlDataReader Data = null;
        #endregion 


        #region Constructors

        /// <summary>
        /// Null Constructor
        /// </summary>
        public User()
          : base()
        { }

        /// <summary>
        /// SignIn constructor
        /// </summary>
        /// <param name="email"></param>
        /// <param name="password"></param>
        /// <param name="role"></param>
        public User(string email, string password, string role)
         : base()
        {
            this.Email = email;
            this.Password = password;
            this.Role = role; 
        }

        /// <summary>
        /// Add user path constructor
        /// </summary>
        /// <param name="name"></param>
        /// <param name="email"></param>
        /// <param name="password"></param>
        /// <param name="role"></param>
        public User(string name, string email, string password, string role, Local local = null)
         : base()
        {
            this.Name = name;
            this.Email = email;
            this.Password = password;
            this.Role = role;
            this.AdmLocal = local;
            
        }

        /*/// <summary>
        /// Get Local by Beacon (admins constructor)
        /// </summary>
        /// <param name="name"></param>
        /// <param name="email"></param>
        /// <param name="admType"></param>
        public User(string name, string email, string admType)
         : base()
        {
            this.Name = name;
            this.Email = email;
            this.AdmType = admType;
        }*/

        #endregion

        #region Public Methods

        public Task<bool> CheckEmail(string email, string role)
        {

           if (role == "cli")
           {
              if (base.DQLCommand(
                $"SELECT COUNT(*) as Count from cliente WHERE nm_email_cliente={email}",
                ref this.Data
              ))
              {
                 if (this.Data.HasRows)
                 {
                    if (this.Data.Read())
                    {
                       if (int.Parse(this.Data["Count"].ToString()) == 1)
                       {
                          return Task.FromResult(true);
                       }
                       return Task.FromResult(false);
                    }
                 }
                 base.Disconnect();
                 return null;
              }
              return null;
           }
           else if (role == "loj" || role == "adm" || role == "dev")
           {
              if (base.DQLCommand(
                $"SELECT COUNT(*) as Count from administrador WHERE nm_email_administrador={email}",
                ref this.Data
              ))
              {
                 if (this.Data.HasRows)
                 {
                    if (this.Data.Read())
                    {
                       if (int.Parse(this.Data["Count"].ToString()) == 1)
                       {
                          return Task.FromResult(true);
                       }
                       return Task.FromResult(false);
                    }
                 }
                 base.Disconnect();
                 return null;
              }
              return null;
           }
           return null;
        }

        public bool Login() 
        {
            if (base.DQLCommand(Procedure.logarUsuario,
                ref this.Data,
                new string[,] {
                    { "pEmail", this.Email } , { "pSenha", this.Password },
                    { "pRole", this.Role}
             }))
            {
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        this.Name = this.Data["nm_user"].ToString();
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return true;
                }
                this.Data.Close();
                base.Disconnect();
                return false;
            }
            return false;
        }

        public async Task<bool> RecoverPassword(string email)
        {
           string cod = GenerateGuidCode();
           if (base.DMLCommand(Procedure.recuperarSenha,
               new string[,]{
                   {"pEmail", email},
                   {"pCdValidacao", cod}
               }
             
           ))
           {
              // Crio uma instância de EmailConfig, passando as informações específicas do email
              EmailConfiguration emailConfig = 
               new EmailConfiguration(
                 email, clsPasswordRecoveryEmail.Name, 
                 $"{cod} {clsPasswordRecoveryEmail.Content} {clsPasswordRecoveryEmail.RecoveryPageURL}"
               );
               // até aqui tá ok
               // instancio EmailSender passando a instância de EmailConfig
               EmailSender emailSender = new EmailSender(emailConfig);
               
               // Aguardo e retorno o resultado booleano do envio do email
               return await emailSender.PostRecoverPasswordEmail() 
               ? true : false;
            }
 
            return false;
        }

        public async Task<List<User>> GetAll(string role)
        {
            List<User> _return = new List<User>();

            if (base.DQLCommand(Procedure.pegarUsuarios,
                  ref this.Data,
                  new string[,] {
                    { "pRole", role }
              }))
            {
                User user = null;
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        user = new User();
                        user.Email = this.Data["nm_email_user"].ToString();
                        user.Name = this.Data["nm_user"].ToString();
                        user.Role = role;
                        if (role == "loj")
                        {
                            user.AdmLocal = await new Local().Get(int.Parse(this.Data["cd_local"].ToString()));
                        }
                        _return.Add(user);
                    }
                }
                this.Data.Close();
                base.Disconnect();
                return _return;
            }
            return null;
        }

        public async Task<User> Get(string role, string email)
        {
            if (base.DQLCommand(Procedure.pegarUsuario,
              ref this.Data,
                  new string[,] {
                    { "pRole", role } , { "pEmail", email }
             }))
            {
                User user = null;
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        user = new User();
                        user.Email = this.Data["nm_email_user"].ToString();
                        user.Name = this.Data["nm_user"].ToString();
                        user.Role = role;
                        if (role == "loj")
                        {
                            user.AdmLocal = await new Local().Get(int.Parse(this.Data["cd_local"].ToString()));
                        }
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return user;
                }
            }

            return null;
        }

        public Task<bool> Add()
        {
            int IdLocal = -1;

            switch (this.Role)
            {
                case "cli":
                    IdLocal = -1; ;
                    break;
                case "adm":
                    IdLocal = -1;
                    break;
                case "loj":
                    IdLocal = this.AdmLocal.IdLocal;
                    break;
            }
            if (base.DMLCommand(Procedure.cadastrarUsuario,
                    new string[,] {
                    { "pEmail", this.Email }, { "pNome", this.Name },
                    { "pSenha", this.Password }, {"pRole", this.Role },
                    { "pLocal" ,  IdLocal.ToString()}
                }))
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        public Task<bool> Update() 
        {
            if (base.DMLCommand(Procedure.atualizarUsuario,
              new string[,] {
                    { "pRole", this.Role } , { "pEmail", this.Email },
                    { "pNome", this.Name },  { "pSenha", this.Password }
             }))
            {
                return Task.FromResult(true);
            }

            return Task.FromResult(false);
        }

        public Task<bool> Delete(string role, string email)
        {
            if (base.DMLCommand(Procedure.deletarUsuario,
                  new string[,] {
                    { "pRole", role } , { "pEmail", email }
                 }))
            {
                return Task.FromResult(true);
            }

            return Task.FromResult(false);
        }


        #endregion

        #region Private Methods

        private static string GenerateGuidCode()
        {
           long i = 1;
           foreach (byte b in Guid.NewGuid().ToByteArray())
           {
              i *= ((int)b + 1);
           }
           return string.Format("{0:x}", i - DateTime.Now.Ticks);
        }

        #endregion
    }
}