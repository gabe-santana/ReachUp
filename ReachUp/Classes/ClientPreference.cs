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
        #endregion

        #region Fields
        MySqlDataReader Data = null;
        #endregion
        #region Constructor
        public ClientPreference() : base() { }

        public ClientPreference(List<SubCategory> SubCategories) : base() 
        {
            this.SubCategories = SubCategories;
        }
        #endregion


        #region Methods
        public async Task<ClientPreference> Get(string email) 
        {
            if (base.DQLCommand(Procedure.clientePrefere, ref this.Data, 
                new string[,] {
                    {"pEmail", email}
                }))
            {
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        string[] cd_subcategories = this.Data["cd_sub_categories"].ToString().Split(',');
                        string[] cd_categories = this.Data["cd_categories"].ToString().Split(',');
                        string[] nm_subcategories = this.Data["nm_sub_categories"].ToString().Split(',');
                        List<SubCategory> subCategories = new List<SubCategory>();
                        int i = 0;
                        foreach (var cd_subcategory in cd_subcategories)
                        {
                            subCategories.Add(new SubCategory(
                                    int.Parse(cd_subcategory),
                                    new Category().Get(int.Parse(cd_categories[i])),
                                    nm_subcategories[i]
                                ));
                            i++;
                        }
                     
                        this.Data.Close();
                        base.Disconnect();
                        return new ClientPreference(subCategories); 
                    }
                }    
            }
            this.Data.Close();
            base.Disconnect();
            return null;
        }
        #endregion
    }
}
