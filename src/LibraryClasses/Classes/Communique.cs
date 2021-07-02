using BusinessLayer.Classes;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace ReachUp
{
    public class Communique : ClsMySqlConnection
    {
        #region Properties
        public int CommuniqueId { get; set; }
        public int LocalId { get; set; }
        [JsonIgnore] public ushort Type { get; set; }
        public Local CommuniqueLocal { get; set; }
        public List<SubCategory> CommuniqueSubCategory;
        public string Description { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }

        #endregion

        #region Fields
        private MySqlDataReader Data = null;
        #endregion

        #region Constructor

        /// <summary>
        /// Null constructor
        /// </summary>
        public Communique() : base() {}

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="communiqueId"></param>
        /// <param name="type"></param>
        /// <param name="communiqueLocal"></param>
        /// <param name="description"></param>
        /// <param name="startDate"></param>
        /// <param name="endDate"></param>
        public Communique(int communiqueId, ushort type, Local communiqueLocal, string description, string startDate, string endDate)
        {
            this.CommuniqueId = communiqueId;
            this.Type = type;
            this.CommuniqueLocal = communiqueLocal;
            this.Description = description;
            this.StartDate = startDate;
            this.EndDate = endDate;
        }

        public Communique(int id, ushort Type, List<SubCategory> SubCategories,
             string Description, string startDate,
             string endDate, Local local) : base()
        {
            this.CommuniqueId = id;
            this.CommuniqueSubCategory = SubCategories;
            this.Description = Description;
            this.StartDate = startDate;
            this.EndDate = endDate;
            this.Type = Type;
            this.CommuniqueLocal = local;
        }

        /// <summary>
        ///  Add communique constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="type"></param>
        /// <param name="description"></param>
        /// <param name="startDate"></param>
        /// <param name="endDate"></param>
        public Communique(int local, ushort type, string description,
        string startDate, string endDate) : base()
        {
            this.LocalId = local;
            this.Type = type;
            this.Description = description;
            this.StartDate = startDate;
            this.EndDate = endDate;
        }

        /// <summary>
        ///  Bind and disbind subcategories constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="subCategories"></param>
        public Communique(int communiqueId, List<SubCategory> subCategories) : base()
        {
            this.CommuniqueId = communiqueId;
            this.CommuniqueSubCategory = subCategories;
        }

        /// <summary>
        ///  Update communique constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="type"></param>
        /// <param name="description"></param>
        /// <param name="startDate"></param>
        /// <param name="endDate"></param>
        /// <param name="local"></param>
        public Communique(int id, ushort Type,
             string Description, string startDate,
             string endDate, Local local) : base()
        {
            this.CommuniqueId = id;
            this.Description = Description;
            this.StartDate = startDate;
            this.EndDate = endDate;
            this.Type = Type;
            this.CommuniqueLocal = local;
        }

        public Communique(int communiqueId, ushort type, string description,
        string startDate, string endDate, int LocalId, List<SubCategory> subCategories) : base()
        {
            this.CommuniqueId = communiqueId;
            this.Type = type;
            this.Description = description;
            this.StartDate = startDate;
            this.EndDate = endDate;
            this.LocalId = LocalId;
            this.CommuniqueSubCategory = subCategories;
        }


        #endregion

        #region Methods

        public async Task<List<Communique>> GetAll(int local, bool general)
        {
            if (base.DQLCommand(Procedure.pegarComunicados, ref this.Data, new string[,] {
                {"pLocal", local.ToString()},
                {"pGeral", general ? "1" : "0"}
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
                                      this.Data["ds_comunicado"].ToString(),
                                      this.Data["dt_inicio_comunicado"].ToString(),
                                      this.Data["dt_fim_comunicado"].ToString(),
                                      int.Parse(this.Data["cd_local"].ToString()),
                                      await new SubCategory().ByCommunique(int.Parse(this.Data["cd_comunicado"].ToString()))
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

        /// <summary>
        /// Gets all active targeted promotions of a local that are relevant to a client
        /// </summary>
        /// <param name="email"></param>
        /// <param name="local"></param>
        /// <returns>Communique object list</returns>
        /// <remarks>Only the subcategories of the promotions that are also preferences of the client are returned</remarks>
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
                        List<SubCategory> favoriteSubCategories = new List<SubCategory>();
                        string[] subs = this.Data["subCategorias_preferidas"].ToString().Split(',');

                        for (int i = 0; i < subs.Length; i++)
                        {
                            string[] subData = subs[i].Split('-');

                            favoriteSubCategories.Add(
                                new SubCategory(
                                int.Parse(subData[1]),
                                await new Category().Get(
                                    int.Parse(subData[0])
                                ),
                                subData[2]
                             )
                            );
                        }

                        communiques.Add(new Communique(
                            int.Parse(this.Data["cd_comunicado"].ToString()),
                            ushort.Parse(this.Data["cd_tipo_comunicado"].ToString()),
                            favoriteSubCategories,
                            this.Data["ds_comunicado"].ToString(),
                            this.Data["dt_inicio_comunicado"].ToString(),
                            this.Data["dt_fim_comunicado"].ToString(),
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

        /// <summary>
        /// Gets all active non-targeted communiques of a local
        /// </summary>
        /// <param name="local"></param>
        /// <returns>Communique object list</returns>
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
                                            this.Data["dt_inicio_comunicado"].ToString(),
                                            this.Data["dt_fim_comunicado"].ToString(),
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

        /// <summary>
        /// Gets all active targeted promotions of a local
        /// </summary>
        /// <param name="local"></param>
        /// <returns>Communique object list</returns>
        /// <remarks>All subcategories of the promotions are returned</remarks>
        public async Task<List<Communique>> GetLocalDirectedPromotions(int local)
        {
           if (base.DQLCommand(Procedure.pegarTodasPromocoesDirecionadasLocal, ref this.Data,
                new string[,]{
                    {"pLocal", local.ToString()}
                }
           ))
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
                            this.Data["dt_inicio_comunicado"].ToString(),
                            this.Data["dt_fim_comunicado"].ToString(),
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

        /// <summary>
        /// Gets all communiques of a local
        /// </summary>
        /// <param name="local"></param>
        /// <param name="isGeneral"></param>
        /// <returns>Communique object list</returns>
        public async Task<List<Communique>> GetLocalCommuniqueHistory(int local, bool isGeneral)
        {
            if (base.DQLCommand(Procedure.pegarHistoricoPromocoesLocal, ref this.Data,
                 new string[,]{
                     {"pLocal", local.ToString()},
                     {"pGeral", Convert.ToInt32(isGeneral).ToString()}
                 }
            ))
            {
                if (this.Data.HasRows)
                {
                    List<Communique> communiques = new List<Communique>();

                    if (isGeneral)
                    {
                       while (this.Data.Read())
                       {
                           communiques.Add(
                                  new Communique(
                                            int.Parse(this.Data["cd_comunicado"].ToString()),
                                            ushort.Parse(this.Data["cd_tipo_comunicado"].ToString()),
                                            await new SubCategory().ByCommunique(int.Parse(this.Data["cd_comunicado"].ToString())),
                                            this.Data["ds_comunicado"].ToString(),
                                            this.Data["dt_inicio_comunicado"].ToString(),
                                            this.Data["dt_fim_comunicado"].ToString(),
                                            await new Local().Get(int.Parse(this.Data["cd_local"].ToString()))
                                      )
                            ); 
                       }
                       this.Data.Close();
                       base.Disconnect();
                       return communiques;
                    }
    
                    else 
                    {
                        while (this.Data.Read())
                        {
                            communiques.Add(
                           new Communique(
                            int.Parse(this.Data["cd_comunicado"].ToString()),
                            ushort.Parse(this.Data["cd_tipo_comunicado"].ToString()),
                            await new SubCategory().ByCommunique(int.Parse(this.Data["cd_comunicado"].ToString())),
                            this.Data["ds_comunicado"].ToString(),
                            this.Data["dt_inicio_comunicado"].ToString(),
                            this.Data["dt_fim_comunicado"].ToString(),
                            await new Local().Get(int.Parse(this.Data["cd_local"].ToString()))
                           )
                          );
                        }
                        this.Data.Close();
                        base.Disconnect();
                        return communiques;
                    }
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Adds a new communique
        /// </summary>
        /// <returns>Bool</returns>
        public Task<bool> Add()
        {
           if (base.DMLCommand(Procedure.publicarComunicado, new string[,] {
                {"pLocal", this.LocalId.ToString() },
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

        /// <summary>
        /// Adds subcategories to a targeted promotion
        /// </summary>
        /// <returns>Bool</returns>
        public Task<bool> BindSubCategories(List<CommuniqueSubCategory> CommuniqueSubCategory)
        {
            for (int i = 0; i < CommuniqueSubCategory.Count(); i++)
            {
                if (!base.DMLCommand(Procedure.relacionarComunicadoSubCategoria, 
                       new string[,] {
                      {"pComunicado", CommuniqueSubCategory[i].Communique.CommuniqueId.ToString()},
                      {"pCategoria", CommuniqueSubCategory[i].Category.CategoryId.ToString() },
                      {"pSubCategoria", CommuniqueSubCategory[i].SubCategory.SubCategoryId.ToString() }
                }))
                {
                    return Task.FromResult(false);
                }
            }
            return Task.FromResult(true);
        }

        /// <summary>
        /// Updates a communique
        /// </summary>
        /// <returns>Bool</returns>
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

        /// <summary>
        /// Deletes subcategories of a targeted promotion
        /// </summary>
        /// <returns>Bool</returns>
        public Task<bool> DisbindSubCategories()
        {
            for (int i = 0; i < this.CommuniqueSubCategory.Count(); i++)
            {
                if (!base.DMLCommand(Procedure.removerSubCategoriaComunicado, 
                       new string[,] {
                      {"pComunicado", this.CommuniqueId.ToString()},
                      {"pCategoria", this.CommuniqueSubCategory[i].Category.CategoryId.ToString() },
                      {"pSubCategoria", this.CommuniqueSubCategory[i].SubCategoryId.ToString() }
                }))
                {
                    return Task.FromResult(false);
                }
            }
            return Task.FromResult(true);
        }
  
        /// <summary>
        /// Deletes a communique
        /// </summary>
        /// <param name="id"></param>
        /// <param name="type"></param>
        /// <returns>Bool</returns>
        public Task<bool> Delete(int id, int type) 
        {
            if (base.DMLCommand(Procedure.deletarComunicado, new string[,] {
                {"pComunicado", id.ToString()},
                {"pTipo", type.ToString()}
            })) 
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }
        #endregion

    }
}
