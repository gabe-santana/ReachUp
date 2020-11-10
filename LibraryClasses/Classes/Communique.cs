using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace ReachUp
{
    public class Communique : clsDatabase
    {
        #region Properties
        public Communique(int communiqueId, ushort type, Local communiqueLocal, string description, DateTime startDate, DateTime endDate) 
        {
            this.CommuniqueId = communiqueId;
                this.Type = type;
                this.CommuniqueLocal = communiqueLocal;
                this.Description = description;
                this.StartDate = startDate;
                this.EndDate = endDate;
               
        }
        public int CommuniqueId { get; set; }
        public int LocalId {get; set; }
        [JsonIgnore] public ushort Type { get; set; }
        public Local CommuniqueLocal { get; set; }
        public List<SubCategory> CommuniqueSubCategory = new List<SubCategory>();
        public string Description { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string NewCommuniqueStartDate { get; set; }
        public string NewCommuniqueEndDate { get; set; }

        #endregion

        #region Fields
        private MySqlDataReader Data = null;
        #endregion

        #region Constructor
        public Communique() : base() { }

        public Communique(int id, ushort Type, List<SubCategory> SubCategories,
             string Description,  DateTime StartDate,
             DateTime EndDate, Local local) : base()
        {
            this.CommuniqueId = id;
            this.CommuniqueSubCategory = SubCategories;
            this.Description = Description;
            this.StartDate = StartDate;
            this.EndDate = EndDate;
            this.Type = Type;
            this.CommuniqueLocal = local;
        }

        /// <summary>
        ///  Add communique constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="category"></param>
        public Communique(int local, ushort type, string description,
        string newStartDate, string newEndDate) : base()
        {
            this.LocalId = local;
            this.Type = type;
            this.Description = description;
            this.NewCommuniqueStartDate = newStartDate;
            this.NewCommuniqueEndDate = newEndDate;
        }
        #endregion

        #region Methods
        public async Task<List<Communique>> Receive(string email, int local)
        {
            if (base.DQLCommand(Procedure.receberPromocoesDirecionadas, ref this.Data,
                new string[,] {
                    {"pLocal", local.ToString()},
                    {"pCliente", email.ToString() }
                }))
            {
                if (this.Data.HasRows)
                {
                    List<Communique> communiques = new List<Communique>();

                    while (this.Data.Read())
                    {
                        communiques.Add(new Communique(
                            int.Parse(this.Data["cd_comunicado"].ToString()),
                            ushort.Parse(this.Data["cd_tipo_comunicado"].ToString()),
                            await new SubCategory().ByCommunique(int.Parse(this.Data["cd_comunicado"].ToString())),
                            this.Data["ds_comunicado"].ToString(),
                            DateTime.Parse(this.Data["dt_inicio_comunicado"].ToString()),
                            DateTime.Parse(this.Data["dt_fim_comunicado"].ToString()),
                            await new Local().Get(int.Parse(this.Data["cd_local"].ToString()))
                            ));
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return communiques;
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        public async Task<List<Communique>> Get(int local) 
        {
            if (base.DQLCommand(Procedure.receberComunicados, ref this.Data, new string[,] {
                {"pLocal", local.ToString()}
            }))
            {
                if (this.Data.HasRows) 
                {
                    List<Communique> communiques = new List<Communique>();

                    while (this.Data.Read()) 
                    {
                        communiques.Add(
                                  new Communique(
                                            int.Parse(this.Data["cd_comunicado"].ToString()),
                                            ushort.Parse(this.Data["cd_tipo_comunicado"].ToString()),
                                            await new SubCategory().ByCommunique(int.Parse(this.Data["cd_comunicado"].ToString())),
                                            this.Data["ds_comunicado"].ToString(),
                                            DateTime.Parse(this.Data["dt_inicio_comunicado"].ToString()),
                                            DateTime.Parse(this.Data["dt_fim_comunicado"].ToString()),
                                            await new Local().Get(int.Parse(this.Data["cd_local"].ToString()))
                                      )
                            ); 
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return communiques;
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        public Task<bool> Add()
        {
           if (base.DMLCommand(Procedure.publicarComunicado, new string[,] {
                {"pLocal", this.LocalId.ToString() },
                {"pTipo", this.Type.ToString() },
                {"pDs", this.Description.ToString() },
                {"pDataInicio", this.NewCommuniqueStartDate.ToString() },
                {"pDataFim", this.NewCommuniqueEndDate.ToString() }
              }))
              {
                 return Task.FromResult(true);
              }
              return Task.FromResult(false);
         }

        public Task<bool> BindSubCategories()
        {
            for (int i = 0; i < this.CommuniqueSubCategory.Count(); i++)
            {
                if (!base.DMLCommand(Procedure.relacionarComunicadoSubCategoria, 
                       new string[,] {
                      {"pCategoria", this.CommuniqueSubCategory[i].Category.CategoryId.ToString() },
                      {"pSubCategoria", this.CommuniqueSubCategory[i].SubCategoryId.ToString() }
                }))
                {
                    return Task.FromResult(false);
                }
            }
            return Task.FromResult(true);
        }

        public Task<bool> Update()
        {
            if (base.DMLCommand(Procedure.atualizarComunicado, new string[,] {
                 {"pComunicado", this.CommuniqueId.ToString() },
                 {"pLocal", this.CommuniqueLocal.IdLocal.ToString() },
                 {"pTipo", this.Type.ToString() },
                 {"pDs", this.Description.ToString() },
                 {"pDataInicio", this.StartDate.ToString() },
                 {"pDataFim", this.EndDate.ToString() }
            })) 
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }
  

        public Task<bool> Delete(int id) 
        {
            if (base.DMLCommand(Procedure.deletarComunicado, new string[,] {
                {"pComunicado", id.ToString()}
            })) 
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }
        #endregion

    }
}
