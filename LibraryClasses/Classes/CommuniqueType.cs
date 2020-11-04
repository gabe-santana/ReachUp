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
            ))
            {
                List<CommuniqueType> communiqueTypes = new List<CommuniqueType>();
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        communiqueTypes.Add(
                          new CommuniqueType(
                            int.Parse(this.Data["cd_tipo_comunicado"].ToString()),
                            this.Data["nm_tipo_comunicado"].ToString()
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
            if (base.DQLCommand(
                $"SELECT COUNT(*) as Count FROM tipo_comunicado",
                ref this.Data
            ))
            {
                int Count = 0;
                while (this.Data.Read()) 
                {
                   Count = int.Parse(this.Data["Count"].ToString());
                }

               if (base.DMLCommand(
                $"INSERT INTO tipo_comunicado VALUES ({Count}, {this.Name})"
                ))
                {
                   this.Data.Close();
                   base.Disconnect();
                   return Task.FromResult(true);
                }
                this.Data.Close();
                base.Disconnect();
                return Task.FromResult(false);
            }
            this.Data.Close();
            base.Disconnect();
            return Task.FromResult(false);
        }

        public Task<bool> Update()
        {
            if (base.DMLCommand(
                $"UPDATE tipo_comunicado SET nm_tipo_comunicado={this.Name} WHERE cd_tipo_comunicado={this.Id}"
            ))
            {
               return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        public Task<bool> Delete(int id)
        {
            if (base.DMLCommand(
                $"DELETE FROM comunicado WHERE cd_tipo_comunicado={id}"
            ))
            {
               if (base.DMLCommand(
                   $"DELETE FROM tipo_comunicado WHERE cd_tipo_comunicado={id}"
               ))
               {
                  return Task.FromResult(true);
               }
               return Task.FromResult(false);
            }
            return Task.FromResult(false);
        }

        #endregion

    }
}
