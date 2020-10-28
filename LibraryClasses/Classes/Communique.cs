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
        public int CommuniqueId { get; set; }
        [JsonIgnore] public ushort Type { get; set; }
        public Local CommuniqueLocal { get; set; }
        public List<SubCategory> CommuniqueSubCategory = new List<SubCategory>();
        public string Description { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

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
        #endregion

        #region Methods
        public async Task<List<Communique>> Receive(User user, int local)
        {
            if (base.DQLCommand(Procedure.receberPromocoesDirecionadas, ref this.Data,
                new string[,] {
                    {"pLocal", local.ToString()},
                    {"pCliente", user.Email.ToString() }
                }))
            {
                List<Communique> communiques = new List<Communique>();
                if (this.Data.HasRows)
                {
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
                }
                this.Data.Close();
                base.Disconnect();

                return communiques;
            }

            return null;
        }

        public async Task<List<Communique>> Get(int local) 
        {
            if (base.DQLCommand(Procedure.receberComunicados, ref this.Data, new string[,] {
                {"pLocal", local.ToString()}
            }))
            {
                List<Communique> communiques = new List<Communique>();
                if (this.Data.HasRows) 
                {
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
                }
                this.Data.Close();
                base.Disconnect();

                return communiques;
            }

            return null;
        }

        public Task<bool> Add()
        {
           if (base.DMLCommand(Procedure.publicarComunicado, new string[,] {
                {"pLocal", this.CommuniqueLocal.IdLocal.ToString() },
                {"pTipo", this.Type.ToString() },
                {"pDs", this.Description.ToString() },
                {"pDataInicio", this.StartDate.ToString() },
                {"pDataFim", this.EndDate.ToString() }
              }))
              {
                  for (int i = 0; i < this.CommuniqueSubCategory.Count(); i++)
                  {
                     if (!base.DMLCommand(Procedure.relacionarComunicadoSubCategoria, new string[,] {
                           {"pCategoria", this.CommuniqueSubCategory[i].Category.CategoryId.ToString() },
                           {"pSubCategoria", this.CommuniqueSubCategory[i].SubCategoryId.ToString() }
                         }))
                         {
                             return Task.FromResult(false);
                         }
                  }
                  return Task.FromResult(true);
              }
              return Task.FromResult(false);
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
