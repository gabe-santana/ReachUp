using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class LocalType : clsDatabase
    {
        #region Properties
        public int Id {get; set;}
        public string Name {get; set;}
        #endregion

        #region Fields    
        private MySqlDataReader Data = null;
        #endregion

        #region Constructor
        public LocalType() : base() { }
        public LocalType(int id, string name) : base()
        {
            this.Id = id;
            this.Name = name;
        }

        public LocalType(int id) : base()
        {
            this.Id = id;
        }

        public LocalType(string name) : base()
        {
            this.Name = name;
        }
        #endregion

        #region Methods

        public Task<List<LocalType>> GetAll()
        {
            if (base.DQLCommand(
                "SELECT * from tipo_local", ref this.Data
            ))
            {
                List<LocalType> localTypes = new List<LocalType>();
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        localTypes.Add(new LocalType(this.Data["cd_tipo_local"].ToString(),
                             this.Data["nm_tipo_local"].ToString()));
                    }
                    this.Data.Close();
                }
                base.Disconnect();
                return Task.FromResult(localTypes);
            }
            return null;
        }

        public Task<bool> Post(int id, string name)
        {
            if (base.DMLCommand(
                $"INSERT INTO tipo_local VALUES ({id}, {name})", ref this.Data
            ))
            {
               return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        #endregion

    }
}


