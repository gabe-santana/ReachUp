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

        #endregion

        #region Fields    
        private MySqlDataReader Data = null;
        #endregion

        #region Constructor
        public Local() : base() { }

        public Local(int id, int type, string name, string typeName, ushort floor, 
          string openingHour, string closingHour, string beaconUUID, List<OpeningHours> alternativeOpeningHours = null
       ) : base()
        {
            this.IdLocal = id;
            this.Type = type;
            this.Name = name;
            this.TypeName = typeName;
            this.Floor = floor; 
            this.OpeningHour = openingHour;
            this.ClosingHour = closingHour;
            this.BeaconUUID = beaconUUID;
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
        string openingHour, string closingHour, string beaconUUID) 
        :base()
        {
           this.IdLocal = id;
           this.Type = type;
           this.TypeName = typeName;
           this.Name = name;
           this.Floor = floor; 
           this.OpeningHour = openingHour;
           this.ClosingHour = closingHour;
           this.BeaconUUID = beaconUUID;
        }
        
    
        /// <summary>
        ///  Add local constructor
        /// </summary>
        /// <param name="type"></param>
        /// <param name="name"></param>
        /// <param name="floor"></param>
        /// <param name="openingHour"></param>
        /// <param name="closingHour"></param>
        /// <param name="beaconUUID"></param>
        public Local(int type, string name, ushort floor, 
        string openingHour, string closingHour, string beaconUUID) 
        :base()
        {
           this.Type = type;
           this.Name = name;
           this.Floor = floor;
           this.OpeningHour = openingHour; 
           this.ClosingHour = closingHour; 
           this.BeaconUUID = beaconUUID;
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
                        locals.Add(new Local(
                                 int.Parse(this.Data["cd_local"].ToString()),
                                 int.Parse(this.Data["cd_tipo_local"].ToString()),
                                 this.Data["nm_tipo_local"].ToString(),
                                 this.Data["nm_local"].ToString(),
                                 ushort.Parse(this.Data["cd_andar"].ToString()),
                                 this.Data["hr_abertura"].ToString(),
                                 this.Data["hr_fechamento"].ToString(),
                                 this.Data["cd_uuid_beacon"].ToString()
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
                            this.Data["cd_uuid_beacon"].ToString(),
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
                            this.Data["cd_uuid_beacon"].ToString(),
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

        public Task<bool> Add()
        {
            if (base.DMLCommand(Procedure.cadastrarLocal, 
                new string[,] {
                    {"pTipo", this.Type.ToString()}, {"pNome", this.Name },
                    {"pAndar", this.Floor.ToString()},
                    {"pAbertura", this.OpeningHour},
                    {"pFechamento", this.ClosingHour},
                    {"pUUIDBeacon", this.BeaconUUID }
                }))
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

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

        public Task<bool> DeleteOpHours(int local, int weekDay)
        {
            if (base.DMLCommand(Procedure.removerHorarioAlternativoLocal,
               new string[,] {
                {"pLocal", local.ToString()},
                {"pDia", weekDay.ToString()}
               }))
            {
               return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

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

        public Task<bool> AddSubCategories()
        {
            for (int i = 0; i < this.SubCategories.Count; i++)
            {
                if (!base.DMLCommand(Procedure.defSubCategoriaLocal, 
                new string[,] {
                    {"pLocal", this.IdLocal.ToString()},
                    {"pCategoria", this.SubCategories[i].Category.CategoryId.ToString()},
                    {"pSubCategoria", this.SubCategories[i].SubCategoryId.ToString()},
                }))
                {
                   return Task.FromResult(false);
                }
            }
            return Task.FromResult(true);
        }

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


        #endregion

    }
}
