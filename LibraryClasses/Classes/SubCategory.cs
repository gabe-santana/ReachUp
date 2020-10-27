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

        public Task<List<SubCategory>> GetAll()
        {
           if (base.DQLCommand(Procedure.pegarSubCategorias, ref this.Data)) 
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

        public Task<List<SubCategory>> ByLocal(int local) 
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

        public Task<List<SubCategory>> ByCommunique(int communique) 
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

        public Task<bool> Add()
        {
           if (base.DMLCommand(Procedure.cadastrarSubCategoria, ref this.Data, new string[,] {
                {"pCdCategoria", this.Category.CategoryId.ToString()},
                {"pNome", this.SubCategoryName}
            }))
            {
               return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        public Task<bool> Delete(int category, int subCategory)
        {
           if (base.DMLCommand(
                $"DELETE FROM sub_categoria WHERE cd_categoria = {category}
                AND cd_sub_categoria = {subCategory} ", 
                ref this.Data, 
              new string[,] {
                {"pCategoria", category.ToString()},
                {"pSubCategoria", subCategory.ToString()}
            }))
            {
               return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }
        
    }
}
