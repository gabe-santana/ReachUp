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
        public User() : base() {}

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

        /// <summary>
        /// Search by name constructor (shopkeeper)
        /// </summary>
        /// <param name="name"></param>
        /// <param name="email"></param>
        /// <param name="admLocal"></param>
        /// <param name="password"></param>
        public User(string name, string email, Local admLocal, string password)
        {
            this.Name = name;
            this.Email = email;
            this.AdmLocal = admLocal;
            this.Password = password;
        }


        #endregion

        #region Public Methods

        /// <summary>
        /// Checks if a user exists
        /// </summary>
        /// <param name="email"></param>
        /// <param name="role"></param>
        /// <returns>Bool</returns>
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

        /// <summary>
        /// Login
        /// </summary>
        /// <returns>Bool</returns>
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

        /// <summary>
        /// Search shopkeepers by name
        /// </summary>
        /// <param name="name"></param>
        /// <returns>User object list</returns>
        public async Task<List<User>> SearchShopkeeperByName(string name)
        {
            if (base.DQLCommand(Procedure.pesquisarUsuarioPorNome, ref this.Data,
              new string[,]{
                  {"pNome", name}, {"pRole", "loj"}
              }
            ))
            {
                if (this.Data.HasRows)
                {
                    List<User> users = new List<User>();
                    while (this.Data.Read())
                    {
                        users.Add(
                            new User(
                               this.Data["nm_administrador"].ToString(),
                               this.Data["nm_email_administrador"].ToString(),
                               await new Local().Get(
                                   int.Parse(this.Data["cd_local"].ToString())
                               ),
                               this.Data["nm_senha_administrador"].ToString()
                            )
                        );
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

        /// <summary>
        /// Gets the local a shopkeeper is associated with
        /// </summary>
        /// <param name="email"></param>
        /// <returns>Local object</returns>
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

        /// <summary>
        /// Generates a password recovery GUID code and sends it by e-mail 
        /// </summary>
        /// <param name="email"></param>
        /// <returns>Bool</returns>
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

        /// <summary>
        /// Checks if a password recovery code exists and is still valid
        /// </summary>
        /// <param name="email"></param>
        /// <param name="cod"></param>
        /// <returns>Bool</returns>
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

        /// <summary>
        /// Updates a user' password
        /// </summary>
        /// <param name="email"></param>
        /// <param name="role"></param>
        /// <param name="password"></param>
        /// <returns>Bool</returns>
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

        /// <summary>
        /// Get all users of a role
        /// </summary>
        /// <param name="role"></param>
        /// <returns>User object list</returns>
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
                        if (user.Role == "loj")
                        {
                            if (this.Data["cd_local"].ToString() != null)
                            {
                                 user.AdmLocal = await new Local().Get(
                                int.Parse(this.Data["cd_local"].ToString())
                                );
                            }
                            else {
                                user.AdmLocal = null;
                            }
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

        /// <summary>
        /// Gets a user
        /// </summary>
        /// <param name="role"></param>
        /// <param name="email"></param>
        /// <returns>User object</returns>
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

        /// <summary>
        /// Registers a user
        /// </summary>
        /// <returns>Bool</returns>
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

        /// <summary>
        /// Updates a user
        /// </summary>
        /// <returns>Bool</returns>
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

        /// <summary>
        /// Deletes a user
        /// </summary>
        /// <param name="role"></param>
        /// <param name="email"></param>
        /// <returns></returns>
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