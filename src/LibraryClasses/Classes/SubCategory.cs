﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class SubCategory : ClsMySqlConnection
    {
        #region Properties
        public int SubCategoryId { get; set; }
        public Category Category { get; set; }
        public int CategoryId { get; set; }
        public string SubCategoryName { get; set; }

        #endregion


        #region Fields    
        private MySqlDataReader Data = null;
        #endregion

        /// <summary>
        /// Null constructor
        /// </summary>
        public SubCategory() : base() { }

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="Id"></param>
        /// <param name="Category"></param>
        /// <param name="Name"></param>
        public SubCategory(int Id, Category Category, string Name) : base()
        {
            this.SubCategoryId = Id;
            this.Category = Category;
            this.SubCategoryName = Name;
        }

        /// <summary>
        ///  Add local subcategories constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="category"></param>
        public SubCategory(int Id, Category Category) : base()
        {
            this.SubCategoryId = Id;
            this.Category = Category;
        }

        /// <summary>
        ///  Get by category constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="name"></param>
        public SubCategory(int Id, string name) : base()
        {
            this.SubCategoryId = Id;
            this.SubCategoryName = name;
        }

        /// <summary>
        /// Gets a subcategory from its concatenated key
        /// </summary>
        /// <param name="categoryId"></param>
        /// <param name="subCategoryId"></param>
        /// <returns>Subcategory object</returns>
        public Task<SubCategory> Get(int categoryId, int subCategoryId)
        {
            if (base.DQLCommand(Procedure.pegarSubCategoria, ref this.Data,
               new string[,]{
                  {"pCategoria", categoryId.ToString()},
                  {"pSubCategoria", subCategoryId.ToString()}
               }
            ))
            {
                if (this.Data.HasRows)
                {
                    SubCategory subCategory = null;

                    if (this.Data.Read())
                    {
                        subCategory = new SubCategory(
                            subCategoryId,
                            this.Data["nm_sub_categoria"].ToString()
                        );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return Task.FromResult(subCategory);
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Gets all subcategories of a category
        /// </summary>
        /// <param name="category"></param>
        /// <returns>Subcategory object list</returns>
        public async Task<List<SubCategory>> ByCategory(int category)
        {
            if (base.DQLCommand(Procedure.pegarSubCategoriasCategoria, ref this.Data,
                 new string[,]{
                     {"pCategoria", category.ToString()}
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
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Gets all subcategories of a local
        /// </summary>
        /// <param name="local"></param>
        /// <returns>Subcategory object list</returns>
        public async Task<List<SubCategory>> ByLocal(int local)
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
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Gets all subcategories of a targeted promotion
        /// </summary>
        /// <param name="communique"></param>
        /// <returns>Subcategory object list</returns>
        public async Task<List<SubCategory>> ByCommunique(int communique)
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
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Registers a subcategory
        /// </summary>
        /// <returns>Bool</returns>
        public Task<bool> Add()
        {
            if (base.DMLCommand(Procedure.cadastrarSubCategoria,
              new string[,] {
                {"pCdCategoria", this.Category.CategoryId.ToString()},
                {"pNome", this.SubCategoryName}
             }))
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        /// <summary>
        /// Deletes a subcategory
        /// </summary>
        /// <param name="category"></param>
        /// <param name="subCategory"></param>
        /// <returns>Bool</returns>
        public Task<bool> Delete(int category, int subCategory)
        {
            if (base.DMLCommand(Procedure.removerSubCategoria,
                 new string[,]{
                   {"pCategoria", category.ToString()},
                   {"pSubCategoria", subCategory.ToString()}
                 }
             ))
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }


    }
}
