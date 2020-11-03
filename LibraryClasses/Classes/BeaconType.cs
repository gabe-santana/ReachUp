using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class BeaconType : clsDatabase
    {
        #region Properties
        public int Id {get; set;}
        public string Name {get; set;}
        #endregion

        #region Fields    
        private MySqlDataReader Data = null;
        #endregion

        #region Constructor
        public BeaconType() : base() { }
        public BeaconType(int id, string name) : base()
        {
            this.Id = id;
            this.Name = name;
        }

        public BeaconType(int id) : base()
        {
            this.Id = id;
        }

        public BeaconType(string name) : base()
        {
            this.Name = name;
        }
        #endregion

        #region Methods

        public Task<List<BeaconType>> GetAll()
        {
            if (base.DQLCommand(
                "SELECT * from tipo_beacon", ref this.Data
            ))
            {
                List<BeaconType> beaconTypes = new List<BeaconType>();
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        beaconTypes.Add(
                            new BeaconType(
                             int.Parse(this.Data["cd_tipo_beacon"].ToString()),
                             this.Data["nm_tipo_beacon"].ToString()
                            )
                        );
                    }
                    this.Data.Close();
                }
                base.Disconnect();
                return Task.FromResult(beaconTypes);
            }
            return null;
        }

        /*public Task<BeaconType> Get(int id)
        {
           if (base.DQLCommand(
               $"SELECT * FROM tipo_beacon WHERE cd_tipo_beacon ={id}",
               ref this.Data
           ))
           {
               BeaconType beaconType = null;
               if (this.Data.HasRows)
               {
                   while(this.Data.Read())
                   {
                       beaconType = new BeaconType(
                         this.Data["cd_tipo_beacon"].ToString(),
                         this.Data["nm_tipo_beacon"].ToString()
                       );
                   }
                   this.Data.Close();
               }
               base.Disconnect();
               return Task.FromResult(beaconType);
           }
           return null;
        }*/

        public Task<bool> Add()
        {
            if (base.DMLCommand(
                $"INSERT INTO tipo_beacon VALUES ({this.Id}, {this.Name})"
            ))
            {
               return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        public Task<bool> Update()
        {
            if (base.DMLCommand(
                $"UPDATE tipo_beacon SET nm_tipo_beacon={this.Name} WHERE cd_tipo_beacon={this.Id}"
            ))
            {
               return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        public Task<bool> Delete(int id)
        {
            if (base.DMLCommand(
                $"DELETE FROM beacon WHERE cd_tipo_beacon={id}"
            ))
            {
               if (base.DMLCommand(
                   $"DELETE FROM tipo_beacon WHERE cd_tipo_beacon={id}"
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
