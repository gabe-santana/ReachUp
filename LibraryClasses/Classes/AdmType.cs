using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class AdmType : clsDatabase
    {
        #region Properties
        public int Id {get; set;}
        public string Name {get; set;}
        #endregion

        #region Fields    
        private MySqlDataReader Data = null;
        #endregion

        #region Constructor
        public AdmType() : base() { }
        public AdmType(int id, string name) : base()
        {
            this.Id = id;
            this.Name = name;
        }

        public AdmType(int id) : base()
        {
            this.Id = id;
        }

        public AdmType(string name) : base()
        {
            this.Name = name;
        }
        #endregion

        #region Methods

        public Task<List<AdmType>> GetAll()
        {
            if (base.DQLCommand(
                "SELECT * from tipo_administrador", ref this.Data
            ))
            {
                List<AdmType> admTypes = new List<AdmType>();
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        admTypes.Add(new AdmType(this.Data["cd_tipo_administrador"].ToString(),
                             this.Data["nm_tipo_administrador"].ToString()));
                    }
                    this.Data.Close();
                }
                base.Disconnect();
                return Task.FromResult(admTypes);
            }
            return null;
        }

        public Task<bool> Add()
        {
            if (base.DMLCommand(
                $"INSERT INTO tipo_administrador VALUES ({this.Id}, {this.Name})", ref this.Data
            ))
            {
               return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        #endregion

    }
}
