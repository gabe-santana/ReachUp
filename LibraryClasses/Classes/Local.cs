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
        [JsonIgnore] public List<User> Admins { get;set; }
        [JsonIgnore] public string DescriptionSubCategories { get; set; }
        [JsonIgnore] public string StrOPHour { get; set; }
        [JsonIgnore] public string StrEHour { get; set; }
        //public List<Beacon> Beacons = new List<Beacon>();
        public List<Beacon> Beacons  {get;set;}
        public string BeaconsUUID {get;set;}


        private List<SubCategory> SubCategories = new List<SubCategory>();

        private List<OpeningHours> OpeningHours_List = new List<OpeningHours>();
        private OpeningHours OpeningHours { get;set; }


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
        /// <param name="type"></param>
        /// <param name="name"></param>
        /// <param name="floor"></param>
        public Local(int id, int type, string name, ushort floor) 
        :base()
        {
           this.IdLocal = id;
           this.Type = type;
           this.Name = name;
           this.Floor = floor; 
        }

        /// <summary>
        ///  Get by Id constructor
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
        ///  Developer constructor (mapMaker)
        /// </summary>
        /// <param name="id"></param>
        /// <param name="type"></param>
        /// <param name="name"></param>
        /// <param name="floor"></param>
        /// <param name="admins"></param>
        /// <param name="beacons"></param>
        public Local(int id, int type, string name, ushort floor,
        List<User> admins = null, List<Beacon> beacons = null ) :base()
        {
           this.IdLocal = id;
           this.Type = type;
           this.Name = name;
           this.Floor = floor; 
           this.Admins = admins;
           this.Beacons = beacons;
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
                            int.Parse(this.Data["cd_tipo_local"].ToString()),
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

        /*public Task<Local> ByBeacon(string uuid)
        {
           if (base.DQLCommand(Procedure.pegarLocalBeacon, ref this.Data, 
               new string[,] {
                   {"pBeacon", uuid.ToString()}
               }))
               {
                   Local local = null;
                   List<User> admins = new List<User>();
                   List<Beacon> beacons = new List<Beacon>();
                   if (this.Data.HasRows)
                   {
                       while (this.Data.Read())
                       {
                           local = new Local(
                               this.Data["cd_local"].ToString(),
                               this.Data["nm_tipo_local"].ToString(),
                               this.Data["nm_local"].ToString(),
                               this.Data["cd_andar"].ToString(),
                               admins.Add(
                                 this.Data["Admins"].ToString()
                               ),
                               beacons.Add(
                                 this.Data["Beacons"].ToString()
                               )
                               
                           );
                       }
                       this.Data.Close();
                       base.Disconnect();
                       return Task.FromResult(local);
                   }
               }
               return null;
        }*/

        public Task<List<Local>> GetAll(string type)
        {
            if (base.DQLCommand(Procedure.pegarLocais, ref this.Data,
                new string[,] {
                    { "pTipo", type.ToString()}
                }))
            {
                List<Local> local = new List<Local>();
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        local.Add(new Local(int.Parse(this.Data["cd_local"].ToString()), int.Parse(this.Data["cd_tipo_local"].ToString()),
                            this.Data["nm_local"].ToString(), ushort.Parse(this.Data["cd_andar"].ToString()),
                            this.Data["sub_categorias"].ToString().Replace(",",", "),                       
                            this.Data["Beacons"].ToString()));
                    }
                }
                this.Data.Close();
                base.Disconnect();

                return Task.FromResult(local);
            }
            return null;
        }


        public Task<bool> Add()
        {
            if (base.DMLCommand(Procedure.cadastrarLocal, 
                new string[,] {
                    {"pTipo", this.Type.ToString()}, {"pNome", this.Name },
                    { "pAndar", this.Floor.ToString()},
                    { "pUUIDBeacon", this.Beacons.Find(x => x.Type == 0).UUID.ToString()}
                }))
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);;
        }

        /*public Task<bool> AddOpHours()
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
        }*/

        public Task<bool> Update()
        {
            if (base.DMLCommand(Procedure.atualizarLocal,
                new string[,] {
                    {"pLocal", this.IdLocal.ToString()}, {"pTipo", this.Type.ToString() },
                    {"pNome", this.Name}, {"pAndar", this.Floor.ToString() }
                }))
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
                OpeningHours opHours = null;
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                       opHours = new OpeningHours(
                           weekDay,
                           DateTime.Parse(this.Data["hr_abertura"].ToString()),
                           DateTime.Parse(this.Data["hr_fechamento"].ToString())
                        );
                    }
                }
                this.Data.Close();
                base.Disconnect();

                return Task.FromResult(opHours);
            }
            return null;
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
