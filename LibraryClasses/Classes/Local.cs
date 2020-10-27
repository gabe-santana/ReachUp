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
        public string Name { get; set; }
        public ushort Floor { get; set; }
        public List<User> Admins { get;set; }
        public string DescriptionSubCategories { get; set; }
        public List<Beacon> Beacons = new List<Beacon>();
        public List<SubCategory> SubCategories = new List<SubCategory>();


        #endregion

        #region Fields    
        private MySqlDataReader Data = null;
        #endregion

        #region Constructor
        public Local() : base() { }

        public Local(int id, int type, string name, ushort floor, string DescriptionSubCategories , string[] uuids = null, List<SubCategory> SubCategories = null) : base()
        {
            this.IdLocal = id;
            this.Type = type;
            this.Name = name;
            this.Floor = floor; 
            this.DescriptionSubCategories = DescriptionSubCategories;
            this.SubCategories = SubCategories;
          
            if (uuids != null)
            {
                foreach (var uuid in uuids)
                {
                    AddBeacon(uuid);
                }
            }

        }

        #endregion

        #region Public Methods
        public Task<Local> ConnectBeaconLocal(string uuidBeacon)
        {
            if (base.DQLCommand(Procedure.conectarBeacon, ref this.Data,
                new string[,] {
                    {"pUUID", uuidBeacon}
                }))
            {
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        Local local = new Local(
                            int.Parse(this.Data["cd_local"].ToString()),
                            int.Parse(this.Data["cd_tipo_local"].ToString()),
                            this.Data["nm_local"].ToString(),
                            ushort.Parse(this.Data["cd_andar"].ToString()),
                            this.Data["sub_categorias"].ToString().Replace(",",", ")
                        );
                        this.Data.Close();
                        base.Disconnect();
                        return Task.FromResult(local);
                    }
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
                    while (this.Data.Read())
                    {
                        locals.Add(new Local(
                                 int.Parse(this.Data["cd_local"].ToString()),
                                 int.Parse(this.Data["cd_tipo_local"].ToString()),
                                 this.Data["nm_local"].ToString(),
                                 ushort.Parse(this.Data["cd_andar"].ToString()),
                                 this.Data["sub_categorias"].ToString().Replace(",", ", "))
                               
                            );
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
                    try
                    {
                        while (this.Data.Read())
                        {
                            local = new Local(id, int.Parse(this.Data["cd_tipo_local"].ToString()),
                                this.Data["nm_local"].ToString(), ushort.Parse(this.Data["cd_andar"].ToString()),
                                this.Data["sub_categorias"].ToString().Replace(",", ", "),
                                this.Data["Beacons"].ToString().Split(','));
                        }
                    }
                    catch { };
                }
                this.Data.Close();
                base.Disconnect();

                return Task.FromResult(local);
            }

            return null;
        }

        public Task<List<Local>> GetAll(string typeName)
        {
            if (base.DQLCommand(Procedure.pegarLocais, ref this.Data,
                new string[,] {
                    { "pTipo", typeName.ToString()}
                }))
            {
                List<Local> local = new List<Local>();
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        local.Add(new Local(int.Parse(this.Data["cd_local"].ToString()), int.Parse(this.Data["cd_tipo_local"].ToString()),
                            this.Data["n_local"].ToString(), ushort.Parse(this.Data["cd_andar"].ToString()),
                            this.Data["sub_categorias"].ToString().Replace(",",", "),                       
                            this.Data["Beacons"].ToString().Split(',')));
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

        public Task<bool> AddOpHours(Local local, OpeningHours openingHours)
        {
            if (base.DMLCommand(Procedure.defHorarioAlternativoLocal,
               new string[,] {
                   { "pLocal", this.localId.ToString() },
                   { "pDia", openingHours.weekDay.ToString() },
                   { "pAbertura", openingHours.opening.ToString() },
                   { "pFechamento", openingHours.closing.ToString() }
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
                    {"pNome", this.Name}, {"pAndar", this.Floor.ToString() }
                }))
            {
                return Task.FromResult(true);
            }

            return Task.FromResult(false);
        }

        public Task<List<string>> FetchOpHours(int localId, int weekDay)
        {
            if (base.DQLCommand(Procedure.buscarHorarioAlternativoLocal, ref this.Data,
                new string[,] {
                    { "pLocal", localId.ToString() },
                    { "pDia", weekDay.ToString() }
                }))
            {
                List<string> opHours = new List<string>();
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                       opHours.Add(this.Data["hr_abertura"].ToString(),
                                   this.Data["hr_fechamento"].ToString());
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

        public Task<bool> AddSubCategories()
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
                Admins = new List<User>();
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        Admins.Add(this.Data["nm_administrador"].ToString(),
                            this.Data["nm_email_administrador"].ToString());
                    }
                }
                this.Data.Close();
                base.Disconnect();

                return Task.FromResult(Admins);
            }
            return null;
        }

        public Task<bool> ConnectAdm(string email, int local)
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
