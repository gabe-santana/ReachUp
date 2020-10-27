using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class Category : clsDatabase
    {
        #region Properties
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
        public string CategoryDescription { get; set; }
        #endregion

        #region Fields
        private MySqlDataReader Data = null;
        #endregion

        #region Constructor
        public Category() : base() { }

        public Category(int Id, string Name, string Description) : base() 
        {
            this.CategoryId = Id;
            this.CategoryName = Name;
            this.CategoryDescription = Description;
        }
        #endregion
        #region Methods

        public Task<Category> Get(int id) 
        {
            if (base.DQLCommand(Procedure.pegarCategoria, ref this.Data,
                new string[,] {
                    {"pCategoria", id.ToString()}
                }))
            {
                Category category = null;
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        category = new Category(int.Parse(this.Data["cd_categoria"].ToString()), 
                            this.Data["nm_categoria"].ToString(), this.Data["ds_categoria"].ToString());
                    }
                }

                this.Data.Close();
                base.Disconnect();

                return Task.FromResult(category);
            }
            return null;
        }

        public Task<bool> Add() 
        {
            if (base.DMLCommand(Procedure.cadastrarCategoria, new string[,] {
                {"pCategoria", this.CategoryId.ToString()},
                {"pNome", this.CategoryName},
                {"pDs", this.CategoryDescription}
            }))
            {
                base.Disconnect();;
                return true;
            }
            base.Disconnect();
            return false;
        }

        public Task<bool> Update()
        {
           if (base.DMLCommand(Procedure.atualizarCategoria, new string[,] {
                {"pCategoria", this.CategoryId.ToString()},
                {"pNome", this.CategoryName},
                {"pDs", this.CategoryDescription}
            }))
            {
                base.Disconnect();;
                return true;
            }
            base.Disconnect();
            return false;
        }

        public Task<bool> Delete(int id)
        {
            if (base.DMLCommand(Procedure.removerCategoria, new string[,] {
                {"pCategoria", id.ToString()},
            }))
            {
                base.Disconnect();
                return true;
            }
            base.Disconnect();
            return false;
        }

        #endregion
    }
}
