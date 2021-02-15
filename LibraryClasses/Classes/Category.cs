using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class Category : clsMySqlConnection
    {
        #region Properties
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
        public string CategoryDescription { get; set; }
        public bool IsSpecial {get; set; }
        #endregion

        #region Fields
        private MySqlDataReader Data = null;
        #endregion

        #region Constructor

        /// <summary>
        /// Null constructor
        /// </summary>
        public Category() : base() {}

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="Id"></param>
        /// <param name="Name"></param>
        /// <param name="Description"></param>
        /// <param name="isSpecial"></param>
        public Category(int Id, string Name, string Description, bool isSpecial) : base() 
        {
            this.CategoryId = Id;
            this.CategoryName = Name;
            this.CategoryDescription = Description;
            this.IsSpecial = isSpecial;
        }

        /// <summary>
        /// Add constructor
        /// </summary>
        /// <param name="Name"></param>
        /// <param name="Description"></param>
        /// <param name="isSpecial"></param>
        public Category(string Name, string Description, bool isSpecial) : base() 
        {
            this.CategoryName = Name;
            this.CategoryDescription = Description;
            this.IsSpecial = isSpecial;
        }

        /// <summary>
        ///  Add local subcategories constructor (subCategory)
        /// </summary>
        /// <param name="id"></param>
        public Category(int Id) : base() 
        {
            this.CategoryId = Id;
        }
        #endregion
        #region Methods

        /// <summary>
        /// Gets a category from its ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Category object</returns>
        public Task<Category> Get(int id) 
        {
            if (base.DQLCommand(Procedure.pegarCategoria, ref this.Data,
                new string[,] {
                    {"pCategoria", id.ToString()}
                }))
            {
                if (this.Data.HasRows)
                {
                    Category category = null;

                    while (this.Data.Read())
                    {
                        category = new Category(
                            int.Parse(this.Data["cd_categoria"].ToString()), 
                            this.Data["nm_categoria"].ToString(), 
                            this.Data["ds_categoria"].ToString(),
                            Convert.ToBoolean(this.Data["ic_especial"].ToString())
                        );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return Task.FromResult(category);
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Gets all categories, or all non-special categories
        /// </summary>
        /// <param name="isGeneral"></param>
        /// <returns>Category object list</returns>
        /// <remarks>"True" parameter returns all categories; "false" returns all non-special categories, that can be 
        /// chosen by the clients as preferences and associated with targeted promotions<remarks>
        public Task<List<Category>> GetAll(bool isGeneral) 
        {
            if (base.DQLCommand(Procedure.pegarCategorias, ref this.Data,
                 new string[,]{
                     {"pGeral", Convert.ToInt32(isGeneral).ToString() }
              }))
            {
                if (this.Data.HasRows)
                {
                    List<Category> categories = new List<Category>();

                    while (this.Data.Read())
                    {
                        categories.Add(
                          new Category(
                            int.Parse(this.Data["cd_categoria"].ToString()),
                            this.Data["nm_categoria"].ToString(),
                            this.Data["ds_categoria"].ToString(),
                            Convert.ToBoolean(this.Data["ic_especial"].ToString())        
                            )
                        );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return Task.FromResult(categories);
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Adds a new category
        /// </summary>
        /// <returns>Bool</returns>
        public Task<bool> Add() 
        {
            if (base.DMLCommand(Procedure.cadastrarCategoria, new string[,] {
                {"pNome", this.CategoryName},
                {"pDs", this.CategoryDescription},
                {"pEspecial", Convert.ToInt32(this.IsSpecial).ToString()}
            }))
            {
                base.Disconnect();
                return Task.FromResult(true);
            }
 
            base.Disconnect();
            return Task.FromResult(false);
        }

        /// <summary>
        /// Updates a category
        /// </summary>
        /// <returns>Bool</returns>
        public Task<bool> Update()
        {
           if (base.DMLCommand(Procedure.atualizarCategoria, new string[,] {
                {"pCategoria", this.CategoryId.ToString()},
                {"pNome", this.CategoryName},
                {"pDs", this.CategoryDescription},
                {"pEspecial", Convert.ToInt32(this.IsSpecial).ToString()}
            }))
            {
                base.Disconnect();
                return Task.FromResult(true);
            }
            base.Disconnect();
            return Task.FromResult(false);
        }

        /// <summary>
        /// Deletes a category
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Bool</returns>
        /// <remarks>Caution: this action performs several chain exclusions</remarks>
        public Task<bool> Delete(int id)
        {
            if (base.DMLCommand(Procedure.removerCategoria, new string[,] {
                {"pCategoria", id.ToString()},
            }))
            {
                base.Disconnect();
                return Task.FromResult(true);
            }
            base.Disconnect();
            return Task.FromResult(false);
        }

        #endregion
    }
}
