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
        [JsonIgnore] public int Type { get; set; }
        public string TypeName { get;set; }
        public string Name { get; set; }
        public ushort Floor { get; set; }
        public string OpeningHour {get; set;}
        public string ClosingHour {get; set;}
        public string BeaconUUID {get; set;}
        [JsonIgnore] public List<User> Admins { get;set; }
        [JsonIgnore] public string DescriptionSubCategories { get; set; }
        [JsonIgnore] public string StrOPHour { get; set; }
        [JsonIgnore] public string StrEHour { get; set; }
        //public List<Beacon> Beacons = new List<Beacon>();
        public List<Beacon> Beacons  {get;set;}
        public string BeaconsUUID {get;set;}

        public string AdminsList {get; set;}
        public string BeaconsList {get; set;}


        public List<SubCategory> SubCategories = new List<SubCategory>();

        public List<OpeningHours> OpeningHours_List = new List<OpeningHours>();
        public OpeningHours OpeningHours { get;set; }


        #endregion

        #region Fields    
        private MySqlDataReader Data = null;
        #endregion

        #region Constructor
        public Local() : base() { }

        public Local(int id, int type, string name, ushort floor, 
        string DescriptionSubCategories , string uuids = null, 
        List<SubCategory> SubCategories = null, List<OpeningHours> OpeningHours_List = null
       ) : base()
        {
            this.IdLocal = id;
            this.Type = type;
            this.Name = name;
            this.Floor = floor; 
            this.DescriptionSubCategories = DescriptionSubCategories;
            this.SubCategories = SubCategories;
            this.OpeningHours_List = OpeningHours_List;
            this.OpeningHours = OpeningHours;

            if (uuids != null)
            {
                 AddBeacon(uuids);   
            }

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
        ///  Get by Id/GetAll by type constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="typeName"></param>
        /// <param name="name"></param>
        /// <param name="floor"></param>
        /// <param name="beacons"></param>
        public Local(int id, string typeName, string name, ushort floor,
        string beaconsUUID) 
        :base()
        {
           this.IdLocal = id;
           this.TypeName = typeName;
           this.Name = name;
           this.Floor = floor; 
           this.BeaconsUUID = beaconsUUID;
        }
        
        
        /// <summary>
        ///  Developer constructor (WebDev)
        /// </summary>
        /// <param name="id"></param>
        /// <param name="typeName"></param>
        /// <param name="name"></param>
        /// <param name="floor"></param>
        /// <param name="adminsList"></param>
        /// <param name="beaconsList"></param>
        public Local(int id, string typeName, string name, ushort floor,
        string adminsList, string beaconsList) :base()
        {
           this.IdLocal = id;
           this.TypeName = typeName;
           this.Name = name;
           this.Floor = floor; 
           this.AdminsList = adminsList;
           this.BeaconsList = beaconsList;
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

        // OK 
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
                this.Data.Close();
                base.Disconnect();
                return null;
            }
            return null;
        }

        // OK 
        public Task<List<Local>> Search(string search)
        {
            List<Local> locals = new List<Local>();
            if (base.DQLCommand(Procedure.pesquisar, ref this.Data,
                new string[,] { { "search", search } }))
            {
                if (this.Data.HasRows)
                {
                    int i = 0;
                    while (this.Data.Read())
                    {
                        locals.Add(new Local(
                                 int.Parse(this.Data["cd_local"].ToString()),
                                 int.Parse(this.Data["cd_tipo_local"].ToString()),
                                 this.Data["nm_local"].ToString(),
                                 ushort.Parse(this.Data["cd_andar"].ToString()),
                                 this.Data["sub_categorias"].ToString().Replace(",", ", "))
                         
                               
                            );

                        locals[i].StrOPHour = this.Data["hr_abertura"].ToString();
                        locals[i].StrEHour = this.Data["hr_fechamento"].ToString();
                        i++;
                    }
                    this.Data.Close();
                    return Task.FromResult(locals);
                }
                base.Disconnect();
            }

            return null;
        }

        // 404 NOT FOUND
        public Task<Local> Get(int id)
        {
            if (base.DQLCommand(Procedure.pegarLocal, ref this.Data,
                new string[,] {
                    { "pID", id.ToString()}
                }))
            {
                Local local = null;
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        local = new Local(
                            id, this.Data["nm_tipo_local"].ToString(),
                            this.Data["nm_local"].ToString(), 
                            ushort.Parse(this.Data["cd_andar"].ToString()),
                            this.Data["Beacons"].ToString()
                           );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return Task.FromResult(local);
                }
                this.Data.Close();
                base.Disconnect();
                return null;
            }
            return null;
        }

        // System.FormatException: Input string was not in a correct format.
        public Task<Local> ByBeacon(string uuid)
        {
           if (base.DQLCommand(Procedure.pegarLocalBeacon, ref this.Data, 
               new string[,] {
                   {"pBeacon", uuid.ToString()}
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
                               ushort.Parse(this.Data["cd_andar"].ToString()),
                               this.Data["Admins"].ToString(),
                               this.Data["Beacons"].ToString()
                            );
                       }
                       this.Data.Close();
                       base.Disconnect();
                       return Task.FromResult(local);
                   }
                   this.Data.Close();
                   base.Disconnect();
                   return null;
               }
               return null;
        }

        // OK (com exceção ao pesquisar pelo tipo 7 - serviço)
        // System.OverflowException: Value was either too large or too small for a UInt16.
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
                        locals.Add(
                            new Local(
                            int.Parse(this.Data["cd_local"].ToString()), 
                            this.Data["nm_tipo_local"].ToString(),
                            this.Data["nm_local"].ToString(), 
                            ushort.Parse(this.Data["cd_andar"].ToString()),
                            this.Data["Beacons"].ToString()
                            )
                        );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return Task.FromResult(locals);
                }
                this.Data.Close();
                base.Disconnect();
                return null;
            }
            return null;
        }

        // 404 NOT FOUND
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

        // OK 
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

        // 404 NOT FOUND
        public Task<bool> Update()
        {
            if (base.DMLCommand(Procedure.atualizarLocal,
                new string[,] {
                    {"pLocal", this.IdLocal.ToString()}, {"pTipo", this.Type.ToString() },
                    {"pNome", this.Name}, {"pAndar", this.Floor.ToString() },
                    {"pAbertura", this.OpeningHour},
                    {"pFechamento", this.ClosingHour}
                }))
            {
                return Task.FromResult(true);
            }

            return Task.FromResult(false);
        }

        // OK 
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
                this.Data.Close();
                base.Disconnect();
                return null;
            }
            return null;
        }

        // OK 
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

        /*public Task<bool> AddSubCategories()
        {
            for (int i = 0; i < this.SubCategories.Count(); i++)
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
        }*/

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

        /*public Task<List<User>> GetAdmins(int local)
        {
             if (base.DQLCommand(Procedure.lojistasLoja, ref this.Data,
                new string[,] {
                    { "pLocal", local.ToString()}
                }))
            {
                List<User> Admins = new List<User>();
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        Admins.Add(
                          new User(
                            this.Data["nm_administrador"].ToString(),
                            this.Data["nm_email_administrador"].ToString()
                          )
                        );
                    }
                }
                this.Data.Close();
                base.Disconnect();

                return Task.FromResult(Admins);
            }
            return null;
        }*/

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

        #region Private Methods
        private async void AddBeacon(string uuid)
        {
            this.Beacons.Add(await new Beacon().Get(uuid));
        }
        #endregion 

    }
}
