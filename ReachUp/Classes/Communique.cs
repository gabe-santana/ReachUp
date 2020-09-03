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
        public Category CommuniqueCategory{ get; set; }
        public string Description { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

        #endregion

        #region Fields
        private MySqlDataReader Data = null;
        #endregion

        #region Constructor
        public Communique() : base() { }

        public Communique(int id, ushort Type, Category CommuniqueCategory,
             string Description,  DateTime StartDate,
             DateTime EndDate, Local local) : base()
        {
            this.CommuniqueId = id;
            this.CommuniqueCategory = CommuniqueCategory;
            this.Description = Description;
            this.StartDate = StartDate;
            this.EndDate = EndDate;
            this.Type = Type;
            this.CommuniqueLocal = local;
        }
        #endregion

        #region Methods
        public async Task<List<Communique>> Receive(User user, int idLocal)
        {
            if (base.DQLCommand(Procedure.receberComunicados, ref this.Data,
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
                            new Category().Get(int.Parse(this.Data["cd_categoria"].ToString())),
                            this.Data["ds_comunicado"].ToString(),
                            DateTime.Parse(this.Data["dt_inicio_comunicado"].ToString()),
                            DateTime.Parse(this.Data["dt_fim_comunicado"].ToString()),
                            await new Local().Get(int.Parse(this.Data["cd_local"].ToString()))
                            ));
                    }
                }
                this.Data.Close();
                base.Disconnect();

                return await Task.FromResult(communiques);
            }

            return null;
        }

        public async Task<List<Communique>> Get(int idLocal) 
        {
            if (base.DQLCommand(Procedure.pegarComunicados, ref this.Data, new string[,] {
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
                                            new Category().Get(int.Parse(this.Data["cd_categoria"].ToString())),
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

                return await Task.FromResult(communiques);
            }

            return null;
        }

        public Task<bool> Add()
        {
            if (base.DMLCommand(Procedure.publicarComunicado, new string[,] {
                {"pLocal",this.CommuniqueLocal.IdLocal.ToString()},
                {"pTipo", this.Type.ToString() },
                {"pCategoria", this.CommuniqueCategory.CategoryId.ToString()},
                {"pDs", this.Description}, {"pDataInicio", this.StartDate.Date.ToString("0000-00-00")},
                {"pDataFim", (this.EndDate == null ? "null" : this.EndDate.ToString("0000-00-00 00:00:00") )}

            }))
            {
                return Task.FromResult(true);
            }

            return Task.FromResult(false);
        }

        public Task<bool> Update() 
        {
            if (base.DMLCommand(Procedure.atualizarComunicado, new string[,] {
                {"pComunicado", this.CommuniqueId.ToString()},
                {"pLocal", this.CommuniqueLocal.IdLocal.ToString()},
                {"pTipo", this.Type.ToString()},
                {"pCategoria", this.CommuniqueCategory.CategoryId.ToString()},
                {"pDs", this.Description},
                {"pDataInicio", this.StartDate.ToString("0000-00-00 00:00:00")},
                {"pDataFim", (this.EndDate == null ? "null" : this.EndDate.ToString("0000-00-00 00:00:00") )}
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
