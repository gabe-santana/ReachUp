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

        /// <summary>
        /// Get admins (local) constructor
        /// </summary>
        /// <param name="name"></param>
        /// <param name="email"></param>
        public User(string name, string email)
         : base()
        {
            this.Name = name;
            this.Email = email;           
        }


        #endregion

        #region Public Methods

        public async Task<bool> CheckEmail(string email, string role)
        {
            if (base.DQLCommand(Procedure.checarEmail, ref this.Data, 
                new string[,] {
                  {"pEmail", email }, {"pRole", role }
              }
            ))
            {
               if (this.Data.HasRows)
               {
                   if (this.Data.Read())
                   {
                      bool _result = Convert.ToBoolean(int.Parse(this.Data["result"].ToString()));
                      this.Data.Close();
                      base.Disconnect();
                      return _result;
                   }
                   base.Disconnect();
                   return false;
               }
               base.Disconnect();
               return false;
            }
            return false;
        }

        public async Task<bool> Login() 
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
                        
                        if (this.Role == "loj")
                        {
                            this.AdmLocal = await new Local().Get(
                               int.Parse(this.Data["cd_local"].ToString()));
                        }

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

        public async Task<Local> GetShopkeeperLocal(string email)
        {
            if (base.DQLCommand(Procedure.pegarLocalLojista, ref this.Data,
              new string[,]{
                  {"pEmail", email}
              }
            ))
            {
                if (this.Data.HasRows)
                {
                    Local local = null;
                    if (this.Data.Read())
                    {
                       local = await new Local().Get(
                           int.Parse(this.Data["cd_local"].ToString())
                       );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return local;
                }
                base.Disconnect();
                return null;
            }
            return null;
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
              EmailConfiguration emailConfig = 
               new EmailConfiguration(
                 email, clsPasswordRecoveryEmail.Name, 
                 $"<strong>{cod}</strong> {clsPasswordRecoveryEmail.Content} {clsPasswordRecoveryEmail.RecoveryPageURL}"
               );
               EmailSender emailSender = new EmailSender(emailConfig);
               
               return await emailSender.PostRecoverPasswordEmail() 
               ? true : false;
            }
 
            return false;
        }

        public async Task<bool> TryUpdatePassword(string email, string cod)
        {
            if (base.DQLCommand(Procedure.verificarRecuperacaoSenha,
                ref this.Data, new string[,] {
                  {"pEmail", email }, {"pCdValidacao", cod}
                }
            ))
            {
                if (this.Data.HasRows)
                {
                    if (this.Data.Read())
                    {
                        bool _result = Convert.ToBoolean(int.Parse(this.Data["result"].ToString()));
                        this.Data.Close();
                        base.Disconnect();
                        return _result;
                    }
                    base.Disconnect();
                    return false;
                }
                base.Disconnect();
                return false;
            }
            return false;
        }

        public async Task<bool> UpdatePassword(string email, string role, string password)
        {
           if(base.DMLCommand(Procedure.atualizarSenha, new string[,] {
                 {"pEmail", email }, {"pRole", role }, 
                 {"pSenha", password }
              }
           ))
           {
              return true;
           }
           return false;
        }

        public async Task<List<User>> GetAll(string role)
        {
    
            if (base.DQLCommand(Procedure.pegarUsuarios, ref this.Data,
                  new string[,] {
                    {"pRole", role }
              }))
            {
                if (this.Data.HasRows)
                {
                    User user = null;
                    List<User> users = new List<User>();

                    while (this.Data.Read())
                    {
                        user = new User();
                        user.Email = this.Data["nm_email_user"].ToString();
                        user.Name = this.Data["nm_user"].ToString();
                        user.Role = role;
                        if (role == "loj")
                        {
                            user.AdmLocal = await new Local().Get(
                                int.Parse(this.Data["cd_local"].ToString())
                                );
                        }
                        users.Add(user);
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return users;
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        public async Task<User> Get(string role, string email)
        {
            if (base.DQLCommand(Procedure.pegarUsuario, ref this.Data,
                  new string[,] {
                    { "pRole", role } , { "pEmail", email }
             }))
            {
                if (this.Data.HasRows)
                {
                    User user = null;

                    while (this.Data.Read())
                    {
                        user = new User();
                        user.Email = this.Data["nm_email_user"].ToString();
                        user.Name = this.Data["nm_user"].ToString();
                        user.Role = role;
                        if (role == "loj")
                        {
                            user.AdmLocal = await new Local().Get(
                                int.Parse(this.Data["cd_local"].ToString())
                                );
                        }
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return user;
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        public Task<bool> Add()
        {
            int IdLocal;

            IdLocal = this.Role == "loj" 
                      ? this.AdmLocal.IdLocal 
                      : -1;

            if (base.DMLCommand(Procedure.cadastrarUsuario,
                    new string[,] {
                    {"pEmail", this.Email}, {"pNome", this.Name},
                    {"pSenha", this.Password}, {"pRole", this.Role},
                    {"pLocal" ,  IdLocal.ToString()}
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
                    {"pRole", this.Role} , {"pEmail", this.Email},
                    {"pNome", this.Name},  {"pSenha", this.Password}
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