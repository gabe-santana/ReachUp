using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class ClientPreference : ClsMySqlConnection
    {
        #region Properties
        public List<SubCategory> SubCategories = new List<SubCategory>();
        public string ClientEmail { get; set; }
        #endregion

        #region Fields
        MySqlDataReader Data = null;
        #endregion

        #region Constructor

        /// <summary>
        /// Null constructor
        /// </summary>
        public ClientPreference() : base() {}

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="SubCategories"></param>
        /// <param name="clientEmail"></param>
        public ClientPreference(List<SubCategory> SubCategories, 
         string clientEmail) : base() 
        {
            this.SubCategories = SubCategories;
            this.ClientEmail = clientEmail;
        }
        #endregion


        #region Methods
       
        /// <summary>
        /// Gets a client's preferences
        /// </summary>
        /// <param name="email"></param>
        /// <returns>SubCategory object list</returns>
        public async Task<List<SubCategory>> GetAll(string email) 
        {
            if (base.DQLCommand(Procedure.clientePrefere, ref this.Data, 
                new string[,] {
                    {"pEmail", email}
                }))
            {
                if (this.Data.HasRows)
                {
                    List<SubCategory> subCategories = new List<SubCategory>();
                    while (this.Data.Read())
                    {
                        subCategories.Add(new SubCategory(
                            int.Parse(this.Data["cd_sub_categoria"].ToString()),
                            await new Category().Get(
                                int.Parse(this.Data["cd_categoria"].ToString())
                            ),
                            this.Data["nm_sub_categoria"].ToString()
                          )
                       );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return subCategories;
                }    
                this.Data.Close();
                base.Disconnect();
                return null;
            }
            this.Data.Close();
            base.Disconnect();
            return null;
        }

        /// <summary>
        /// Adds a client's preferences
        /// </summary>
        /// <returns>Bool</returns>
        public Task<bool> Add()
        {
            for (int i = 0; i < this.SubCategories.Count(); i++)
            {
                if (!base.DMLCommand(Procedure.definirPreferencia, 
                   new string[,] {
                  {"pEmail", this.ClientEmail},
                  {"pCdSubCategoria", this.SubCategories[i].SubCategoryId.ToString()},
                  {"pCdCategoria", this.SubCategories[i].Category.CategoryId.ToString()}
                  }))
                  {
                     return Task.FromResult(false);
                  }
            }
            return Task.FromResult(true);
        }

        /// <summary>
        /// Deletes a preference of a client
        /// </summary>
        /// <param name="email"></param>
        /// <param name="category"></param>
        /// <param name="subCategory"></param>
        /// <returns>Bool</returns>
        public Task<bool> Delete(string email, int category, int subCategory)
        {
             if (base.DMLCommand(Procedure.removerPreferencia, 
                new string[,] {
                {"pEmail", email},
                {"pCdSubCategoria", category.ToString()},
                {"pCdCategoria", subCategory.ToString()}
              }))
              {
                 return Task.FromResult(true);
              }
              return Task.FromResult(false);
        }
        #endregion
    }
}
