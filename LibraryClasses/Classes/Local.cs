using LibraryClasses.Classes;
using MySql.Data.MySqlClient;
using ReachUp;
using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace ReachUp
{
    public class Local : clsDatabase
    {
        #region Properties 
        public int IdLocal { get; set; }
        public int Type { get; set; }
        public string TypeName { get;set; }
        public string Name { get; set; }
        public ushort Floor { get; set; }
        public string OpeningHour {get; set;}
        public string ClosingHour {get; set;}
        public string BeaconUUID {get; set;}
        public List<OpeningHours> AlternativeOpeningHours {get; set;}
        public List<SubCategory> SubCategories {get; set;}
        public OpeningHours OpeningHours {get; set;}
        public bool IsAvailable {get; set;}

        #endregion

        #region Fields    
        private MySqlDataReader Data = null;
        #endregion

        #region Constructor

        /// <summary>
        /// Null constructor
        /// </summary>
        public Local() : base() {}

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="type"></param>
        /// <param name="name"></param>
        /// <param name="typeName"></param>
        /// <param name="floor"></param>
        /// <param name="openingHour"></param>
        /// <param name="closingHour"></param>
        /// <param name="isAvailable"></param>
        /// <param name="beaconUUID"></param>
        /// <param name="alternativeOpeningHours"></param>
        public Local(int id, int type, string name, string typeName, ushort floor, 
          string openingHour, string closingHour, bool isAvailable, List<OpeningHours> alternativeOpeningHours = null
       ) : base()
        {
            this.IdLocal = id;
            this.Type = type;
            this.Name = name;
            this.TypeName = typeName;
            this.Floor = floor; 
            this.OpeningHour = openingHour;
            this.ClosingHour = closingHour;
            this.IsAvailable = isAvailable;
            this.AlternativeOpeningHours = alternativeOpeningHours;
        }

        /// <summary>
        ///  Connect constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="typeName"></param>
        /// <param name="name"></param>
        /// <param name="floor"></param>
        public Local(int id, string typeName, string name, ushort floor) 
        :base()
        {
           this.IdLocal = id;
           this.TypeName = typeName;
           this.Name = name;
           this.Floor = floor; 
        }

        /// <summary>
        ///  Search constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="type"></param>
        /// <param name="typeName"></param>
        /// <param name="name"></param>
        /// <param name="floor"></param>
        /// <param name="openingHour"></param>
        /// <param name="closingHour"></param>
        /// <param name="beaconUUID"></param>
        public Local(int id, int type, string typeName, string name, ushort floor,
        string openingHour, string closingHour, bool isAvailable) 
        :base()
        {
           this.IdLocal = id;
           this.Type = type;
           this.TypeName = typeName;
           this.Name = name;
           this.Floor = floor; 
           this.OpeningHour = openingHour;
           this.ClosingHour = closingHour;
           this.IsAvailable = isAvailable;
        }
        
    
        /// <summary>
        ///  Add local constructor
        /// </summary>
        /// <param name="type"></param>
        /// <param name="name"></param>
        /// <param name="floor"></param>
        /// <param name="openingHour"></param>
        /// <param name="closingHour"></param>
        public Local(int type, string name, ushort floor, 
        string openingHour, string closingHour) 
        :base()
        {
           this.Type = type;
           this.Name = name;
           this.Floor = floor;
           this.OpeningHour = openingHour; 
           this.ClosingHour = closingHour; 
        }

        /// <summary>
        ///  Add subcategories constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="subCategories"></param>
        public Local(int id, List<SubCategory> subCategories = null) 
        :base()
        {
           this.IdLocal = id;
           this.SubCategories = subCategories;
        }

        /// <summary>
        ///  Define alternate time constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="openingHours"></param>
        public Local(int id, OpeningHours openingHours = null) 
        :base()
        {
           this.IdLocal = id;
           this.OpeningHours = openingHours;
        }

        /// <summary>
        ///  Update local constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="type"></param>
        /// <param name="name"></param>
        /// <param name="floor"></param>
        /// <param name="openingHour"></param>
        /// <param name="closingHour"></param>
        public Local(int id, int type, string name, ushort floor, 
        string openingHour, string closingHour) 
        :base()
        {
           this.IdLocal = id;
           this.Type = type;
           this.Name = name;
           this.Floor = floor;
           this.OpeningHour = openingHour; 
           this.ClosingHour = closingHour; 
        }

        #endregion;

        #region Public Methods

        /// <summary>
        /// Takes the basic information of a local from its identification beacon
        /// </summary>
        /// <param name="uuid"></param>
        /// <returns>Local object</returns>
        public Task<Local> ConnectBeaconLocal(string uuid)
        {
            if (base.DQLCommand(Procedure.conectarBeacon, ref this.Data,
                new string[,] {
                    {"pUUID", uuid}
                }))
            {
                if (this.Data.HasRows)
                {
                    Local local = null;
                    while (this.Data.Read())
                    {
                        local = new Local(
                            int.Parse(this.Data["cd_local"].ToString()),
                            this.Data["nm_tipo_local"].ToString(),
                            this.Data["nm_local"].ToString(),
                            ushort.Parse(this.Data["cd_andar"].ToString())
                        );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return Task.FromResult(local);
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Picks up locals from user-client search
        /// </summary>
        /// <param name="search"></param>
        /// <returns>Local object list</returns>
        /// <remarks>Returns only available locations, that are not temporarily banned or something</remarks>
        public Task<List<Local>> Search(string search)
        {
            if (base.DQLCommand(Procedure.pesquisar, ref this.Data,
                new string[,] { { "search", search } }))
            {
                if (this.Data.HasRows)
                {
                    List<Local> locals = new List<Local>();

                    while (this.Data.Read())
                    {
                        if (Convert.ToBoolean(this.Data["ic_disponivel"].ToString()))
                        {
                            locals.Add(new Local(
                                 int.Parse(this.Data["cd_local"].ToString()),
                                 int.Parse(this.Data["cd_tipo_local"].ToString()),
                                 this.Data["nm_tipo_local"].ToString(),
                                 this.Data["nm_local"].ToString(),
                                 ushort.Parse(this.Data["cd_andar"].ToString()),
                                 this.Data["hr_abertura"].ToString(),
                                 this.Data["hr_fechamento"].ToString(),
                                 Convert.ToBoolean(this.Data["ic_disponivel"].ToString())
                              ) 
                           );
                        }
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return Task.FromResult(locals);
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Picks up locals from user-dev or user-admin search
        /// </summary>
        /// <param name="search"></param>
        /// <returns>Local object list</returns>
        /// <remarks>Returns all found locations</remarks>
        public Task<List<Local>> Seek(string search)
        {
            if (base.DQLCommand(Procedure.pesquisar, ref this.Data,
                new string[,] { { "search", search } }))
            {
                if (this.Data.HasRows)
                {
                    List<Local> locals = new List<Local>();

                    while (this.Data.Read())
                    {
                        locals.Add(new Local(
                                 int.Parse(this.Data["cd_local"].ToString()),
                                 int.Parse(this.Data["cd_tipo_local"].ToString()),
                                 this.Data["nm_tipo_local"].ToString(),
                                 this.Data["nm_local"].ToString(),
                                 ushort.Parse(this.Data["cd_andar"].ToString()),
                                 this.Data["hr_abertura"].ToString(),
                                 this.Data["hr_fechamento"].ToString(),
                                 Convert.ToBoolean(this.Data["ic_disponivel"].ToString())
                              ) 
                        );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return Task.FromResult(locals);
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Get a local from its ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Local object</returns>
        public Task<Local> Get(int id)
        {
            if (base.DQLCommand(Procedure.pegarLocal, ref this.Data,
                new string[,] {
                    { "pID", id.ToString()}
                }))
            {
                if (this.Data.HasRows)
                {
                    Local local = null;

                    while (this.Data.Read())
                    {
                        List<OpeningHours> alternativeOpHours = new List<OpeningHours>();
                        string[] horas = this.Data["horarios_alternativos"].ToString().Split(',');

                        for (int i = 0; i < horas.Length; i++)
                           {
                               alternativeOpHours.Add(
                                   new OpeningHours(
                                     int.Parse(horas[i].Substring(0,1)),
                                     horas[i].Substring(2,8),
                                     horas[i].Substring(11,8)
                                   )
                               );
                           }
                        
                        local = new Local(
                            id, int.Parse(this.Data["cd_tipo_local"].ToString()),
                            this.Data["nm_local"].ToString(),
                            this.Data["nm_tipo_local"].ToString(), 
                            ushort.Parse(this.Data["cd_andar"].ToString()),
                            this.Data["hr_abertura"].ToString(),
                            this.Data["hr_fechamento"].ToString(),
                            Convert.ToBoolean(this.Data["ic_disponivel"].ToString()),
                            alternativeOpHours
                           );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return Task.FromResult(local);
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Gets locals of a type
        /// </summary>
        /// <param name="type"></param>
        /// <returns>Local object list</returns>
        public Task<List<Local>> GetAll(int type)
        {
            if (base.DQLCommand(Procedure.pegarLocais, ref this.Data,
                new string[,] {
                    { "pTipo", type.ToString()}
                }))
            {
                if (this.Data.HasRows)
                {
                    List<Local> locals = new List<Local>();

                    while (this.Data.Read())
                    {
                        List<OpeningHours> alternativeOpHours = new List<OpeningHours>();
                        string[] horas = this.Data["horarios_alternativos"].ToString().Split(',');

                        for (int i = 0; i < horas.Length; i++)
                           {
                               alternativeOpHours.Add(
                                   new OpeningHours(
                                     int.Parse(horas[i].Substring(0,1)),
                                     horas[i].Substring(2,8),
                                     horas[i].Substring(11,8)
                                   )
                               );
                           }

                        locals.Add(
                            new Local(
                            int.Parse(this.Data["cd_local"].ToString()), 
                            int.Parse(this.Data["cd_tipo_local"].ToString()),
                            this.Data["nm_local"].ToString(),
                            this.Data["nm_tipo_local"].ToString(), 
                            ushort.Parse(this.Data["cd_andar"].ToString()),
                            this.Data["hr_abertura"].ToString(),
                            this.Data["hr_fechamento"].ToString(),
                            Convert.ToBoolean(this.Data["ic_disponivel"].ToString()),
                            alternativeOpHours
                            )
                        );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return Task.FromResult(locals);
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Checks if a beacon is already registered, from its uuid
        /// </summary>
        /// <param name="uuid"></param>
        /// <returns>Boolean</returns>
        /// <remarks>Use this method to prevent a local from being registered, if the beacon being associated with it already exists. 
        /// This avoid incomplete registration of the location information.</remarks>
        public Task<string> CheckBeacon(string uuid)
        {
           if (base.DQLCommand(Procedure.checarBeacon, ref this.Data,
              new string[,] {
                 {"pUUID", uuid }
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
                       return Task.FromResult(Convert.ToString(_result));
                   }
                   base.Disconnect();
                   return Task.FromResult("Erro na verificação de existência do beacon");
               }
               base.Disconnect();
               return Task.FromResult("Erro na verificação de existência do beacon");
           }
           return Task.FromResult("Erro na verificação de existência do beacon");
        }

        /// <summary>
        /// Registers a new local
        /// </summary>
        /// <returns>Bool</returns>
        /// <remarks>Alternate opening hours are added, on all weekdays, with the standard opening hours.
        /// This avoids errors in other actions of the system</remarks>
        public Task<bool> Add()
        {
            if (base.DMLCommand(Procedure.cadastrarLocal, 
                new string[,] {
                    {"pTipo", this.Type.ToString()}, {"pNome", this.Name },
                    {"pAndar", this.Floor.ToString()},
                    {"pAbertura", this.OpeningHour},
                    {"pFechamento", this.ClosingHour}
                }))
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        /// <summary>
        /// Updates the local's alternate opening hours, on a specific weekday
        /// </summary>
        /// <returns>Bool</returns>
        /// <remarks>The old alternate opening hours of the local on this weekday is deleted</remarks>
        public Task<bool> AddOpHours()
        {
            if (base.DMLCommand(Procedure.defHorarioAlternativoLocal,
               new string[,] {
                   { "pLocal", this.IdLocal.ToString() },
                   { "pDia", this.OpeningHours.WeekDay.ToString() },
                   { "pAbertura", this.OpeningHours.OpeningTime.ToString() },
                   { "pFechamento", this.OpeningHours.ClosingTime.ToString() }
                }))
            {
               return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        /// <summary>
        /// Updates the local: type, name, floor and standard opening hours
        /// </summary>
        /// <returns>Bool</returns>
        public Task<bool> Update()
        {
            if (base.DMLCommand(Procedure.atualizarLocal,
                new string[,] {
                    {"pLocal", this.IdLocal.ToString()}, {"pTipo", this.Type.ToString() },
                    {"pNome", this.Name}, {"pAndar", this.Floor.ToString() },
                    {"pAbertura", this.OpeningHour},
                    {"pFechamento", this.ClosingHour}
                }
            ))
            {
                return Task.FromResult(true);
            }

            return Task.FromResult(false);
        }

        /// <summary>
        /// Gets the local's alternate opening hours on a weekday
        /// </summary>
        /// <param name="local"></param>
        /// <param name="weekDay"></param>
        /// <returns>OpeningHours object</returns>
        public Task<OpeningHours> FetchOpHours(int local, int weekDay)
        {
            if (base.DQLCommand(Procedure.buscarHorarioAlternativoLocal, ref this.Data,
                new string[,] {
                    { "pLocal", local.ToString() },
                    { "pDia", weekDay.ToString() }
                }))
            {

                if (this.Data.HasRows)
                {
                    OpeningHours opHours = null;

                    while (this.Data.Read())
                    {
                       opHours = new OpeningHours(
                           weekDay,
                           this.Data["hr_abertura"].ToString(),
                           this.Data["hr_fechamento"].ToString()
                        );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return Task.FromResult(opHours);
                }
                base.Disconnect();
                return null;
            }
            return null;
        }
        
        /// <summary>
        /// Deletes a location from its ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Bool</returns>
        /// <remarks>This action may only be done when removing the beacon from a physical space in the mall, 
        /// without putting a new one in place, as the area will no longer be used. To change the local that owns
        /// the physical space, use the "Update" method. To change the location identification beacon, use the
        /// Beacon class addition method, after removing the old beacon.</remarks>
        public Task<bool> Delete(int id) 
        {
            if (base.DMLCommand(Procedure.deletarLocal,
                 new string[,] {
                    {"pLocal", id.ToString()}
                 }))
            {
                return Task.FromResult(true);
            }

            return Task.FromResult(false);
        }

        /// <summary>
        /// Adds subcategories to a local
        /// </summary>
        /// <returns>Bool</returns>
        /// <remarks>This action should be performed after registering the location, or changing the establishiment that owns it</remarks>
        public Task<bool> AddSubCategories(List<SubCategoryLocal> subCategoryLocal)
        {
            for (int i = 0; i < subCategoryLocal.Count; i++)
            {
                if (!base.DMLCommand(Procedure.defSubCategoriaLocal, 
                new string[,] {
                    {"pLocal", subCategoryLocal[i].Local.IdLocal.ToString()},
                    {"pCategoria", subCategoryLocal[i].Category.CategoryId.ToString()},
                    {"pSubCategoria", subCategoryLocal[i].SubCategory.SubCategoryId.ToString()},
                }))
                {
                   return Task.FromResult(false);
                }
            }
            return Task.FromResult(true);
        }

        /// <summary>
        /// Delete a subcategory from a local
        /// </summary>
        /// <param name="local"></param>
        /// <param name="category"></param>
        /// <param name="subCategory"></param>
        /// <returns>Bool</returns>
        /// <remarks>This action should be performed after changing the establishiment that owns the location</remarks>
        public Task<bool> DeleteSubCategory(int local, int category, int subCategory)
        {
             if (base.DMLCommand(Procedure.removerSubCategoriaLocal, 
                new string[,] {
                    {"pLocal", local.ToString()},
                    {"pCategoria", category.ToString()},
                    {"pSubCategoria", subCategory.ToString()},
                }))
                {
                   return Task.FromResult(true);
                }
                return Task.FromResult(false);
        }

        /// <summary>
        /// Gets the administrators of a local
        /// </summary>
        /// <param name="local"></param>
        /// <returns>User object list</returns>
        /// <remarks>Reminder: only shopkeepers can be connected to a location; the mall administrators does not have this explicit relationship</remarks>
        public Task<List<User>> GetAdmins(int local)
        {
             if (base.DQLCommand(Procedure.lojistasLoja, ref this.Data,
                new string[,] {
                    { "pLocal", local.ToString()}
                }))
            {
                if (this.Data.HasRows)
                {
                    List<User> Admins = new List<User>();

                    while (this.Data.Read())
                    {
                        Admins.Add(
                            new User(
                            this.Data["nm_administrador"].ToString(),
                            this.Data["nm_email_administrador"].ToString()
                          )
                        );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return Task.FromResult(Admins);
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Connects a shopkeeper to a local
        /// </summary>
        /// <param name="email"></param>
        /// <param name="local"></param>
        /// <returns>Bool</returns>
        /// <remarks>This action should be performed after registering the shopkeeper</remarks>
        public Task<bool> ConnectAdmin(string email, int local)
        {
            if (base.DMLCommand(Procedure.darAdm, 
                new string[,] {
                    {"pEmail", email.ToString()},
                    {"pCdLocal", local.ToString()}
                }))
                {
                   return Task.FromResult(true);
                }
                return Task.FromResult(false);
        }

        /// <summary>
        /// Updates the availability status of a local (banned or not), according to the current state
        /// </summary>
        /// <param name="local"></param>
        /// <returns>Bool</returns>
        public Task<bool> UpdateAvailability(int local)
        {
            if (base.DMLCommand(Procedure.editarDisponibilidadeLocal, 
              new string[,]{
                  {"pLocal", local.ToString()}
              }
            ))
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }


        #endregion

    }
}
