using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class ClientPreference : clsDatabase
    {
        #region Properties
        public List<SubCategory> SubCategories = new List<SubCategory>();
        public string ClientEmail { get; set; }
        #endregion

        #region Fields
        MySqlDataReader Data = null;
        #endregion
        #region Constructor
        public ClientPreference() : base() { }

        public ClientPreference(List<SubCategory> SubCategories, 
         string clientEmail) : base() 
        {
            this.SubCategories = SubCategories;
            this.ClientEmail = clientEmail;
        }
        #endregion


        #region Methods
       
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
