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
        public DateTime StartDate { get; set; }.
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
        public Task<List<Communique>> Receive(User user, int local)
        {
            if (base.DQLCommand(Procedure.receberPromocoesDirecionadas, ref this.Data,
                new string[,] {
                    {"pLocal",idLocal.ToString()},
                    {"pCliente", user.Email }
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
                            await new SubCategory().getByCommunique(int.Parse(this.Data["cd_comunicado"].ToString())),
                            this.Data["ds_comunicado"].ToString(),
                            DateTime.Parse(this.Data["dt_inicio_comunicado"].ToString()),
                            DateTime.Parse(this.Data["dt_fim_comunicado"].ToString()),
                            await new Local().Get(int.Parse(this.Data["cd_local"].ToString()))
                            ));
                    }
                }
                this.Data.Close();
                base.Disconnect();

                return Task.FromResult(communiques);
            }

            return null;
        }

        public Task<List<Communique>> Get(int local) 
        {
            if (base.DQLCommand(Procedure.receberComunicados, ref this.Data, new string[,] {
                {"pLocal", idLocal.ToString()}
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
                                            await new SubCategory().getByCommunique(int.Parse(this.Data["cd_comunicado"].ToString())),
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

                return Task.FromResult(communiques);
            }

            return null;
        }

        public Task<bool> Add()
        {
           if (base.DMLCommand(Procedure.publicarComunicado, new string[,] {
                {"pLocal", this.CommuniqueLocal.IdLocal },
                {"pTipo", this.Type },
                {"pDs", this.Description },
                {"pDataInicio", this.StartDate },
                {"pDataFim", this.EndDate }
              }))
              {
                  for (int i = 0; i < this.CommuniqueSubCategory.Count(); i++)
                  {
                     if (!base.DMLCommand(Procedure.relacionarComunicadoSubCategoria, new string[,] {
                           {"pCategoria", this.CommuniqueSubCategory[i].Category.CategoryId },
                           {"pSubCategoria", this.CommuniqueSubCategory[i].SubCategoryId }
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
                 {"pComunicado", this.CommuniqueId },
                 {"pLocal", this.CommuniqueLocal.IdLocal },
                 {"pTipo", this.Type },
                 {"pDs", this.Description },
                 {"pDataInicio", this.StartDate },
                 {"pDataFim", this.EndDate }
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
