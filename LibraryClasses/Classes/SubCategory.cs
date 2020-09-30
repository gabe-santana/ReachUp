using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class SubCategory : clsDatabase
    {
        #region Properties
        private int SubCategoryId { get; set; }
        public Category Category { get;set; }
        public string SubCategoryName { get; set; }
        public SubCategory() : base() { }
        #endregion

        #region Fields    
        private MySqlDataReader Data = null;
        #endregion

        public SubCategory(int Id, Category Category, string Name) : base() 
        {
            this.SubCategoryId = Id;
            this.Category = Category;
            this.SubCategoryName = Name;
        }

        public async Task<List<SubCategory>> getAll()
        {
           if (base.DQL(Procedure.pegarSubCategorias, ref this.Data)) 
           {
              if (this.Data.HasRows)
              {
                  List<SubCategory> subCategories = new List<SubCategory>();

                  while (this.Data.Read())
                  {
                     subCategories.Add(
                         new SubCategory(
                              int.Parse(this.Data["cd_sub_categoria"].ToString()),
                              await new Category().Get(int.Parse(this.Data["cd_categoria"].ToString())),
                              this.Data["nm_sub_categoria"].ToString()
                            )
                        );
                   }

                   this.Data.Close();
                   base.Disconnect();
                   return subCategories;
              }
           }

           return null;
        }

        public async Task<List<SubCategory>> getByLocal(int local) 
        {
            if (base.DQLCommand(Procedure.pegarSubcategoriasLocal, ref this.Data, new string[,] {
                {"pLocal", local.ToString()}
            }))
            {
                if (this.Data.HasRows)
                {
                    List<SubCategory> subCategories = new List<SubCategory>();

                    while (this.Data.Read()) 
                    {
                        subCategories.Add(
                            new SubCategory(
                                 int.Parse(this.Data["cd_sub_categoria"].ToString()),
                                 await new Category().Get(int.Parse(this.Data["cd_categoria"].ToString())),
                                 this.Data["nm_sub_categoria"].ToString(),
                                 this.Data["nm_categoria"].ToString()
                                )
                            );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return subCategories;
                }
            }
            return null;
        }

        public async Task<List<SubCategory>> getByCommunique(int communique) 
        {
            if (base.DQLCommand(Procedure.pegarSubCategoriasComunicado, ref this.Data, new string[,] {
                {"pComunicado", communique.ToString()}
            }))
            {
                if (this.Data.HasRows)
                {
                    List<SubCategory> subCategories = new List<SubCategory>();

                    while (this.Data.Read()) 
                    {
                        subCategories.Add(
                            new SubCategory(
                                 int.Parse(this.Data["cd_sub_categoria"].ToString()),
                                 await new Category().Get(int.Parse(this.Data["cd_categoria"].ToString())),
                                 this.Data["nm_sub_categoria"].ToString(),
                                 this.Data["nm_categoria"].ToString()
                              )
                            );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return subCategories;
                }
            }
            return null;
        }
    }
}
