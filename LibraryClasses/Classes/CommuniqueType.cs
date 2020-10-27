using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class CommuniqueType : clsDatabase
    {
        #region Properties
        public int Id {get; set;}
        public string Name {get; set;}
        #endregion

        #region Fields    
        private MySqlDataReader Data = null;
        #endregion

        #region Constructor
        public CommuniqueType() : base() { }
        public CommuniqueType(int id, string name) : base()
        {
            this.Id = id;
            this.Name = name;
        }

        public CommuniqueType(int id) : base()
        {
            this.Id = id;
        }

        public CommuniqueType(string name) : base()
        {
            this.Name = name;
        }
        #endregion

        #region Methods

        public Task<List<CommuniqueType>> GetAll()
        {
            if (base.DQLCommand(
                "SELECT * from tipo_comunicado", ref this.Data
            )).
            {
                List<CommuniqueType> communiqueTypes = new List<CommuniqueType>();
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        communiqueTypes.Add(
                          new CommuniqueType(
                            this.Data["cd_tipo_comunicado"].ToString(),
                            this.Data["nm_tipo_comunicado"]
                          )
                        );
                    }
                    this.Data.Close();
                }
                base.Disconnect();
                return Task.FromResult(communiqueTypes);
            }
            return null;
        }

        public Task<bool> Add()
        {
            if (base.DMLCommand(
                $"INSERT INTO tipo_comunicado VALUES ({this.Id}, {this.Name})", 
                ref this.Data
            ))
            {
               return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        #endregion

    }
}
