using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class BeaconType : ClsMySqlConnection
    {
        #region Properties
        public int Id {get; set;}
        public string Name {get; set;}
        #endregion

        #region Fields    
        private MySqlDataReader Data = null;
        #endregion

        #region Constructor

        /// <summary>
        /// Null constructor
        /// </summary>
        public BeaconType() : base() {}

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="name"></param>
        public BeaconType(int id, string name) : base()
        {
            this.Id = id;
            this.Name = name;
        }

        /// <summary>
        /// Add constructor
        /// </summary>
        /// <param name="name"></param>
        public BeaconType(string name) : base()
        {
            this.Name = name;
        }
        #endregion

        #region Methods

        /// <summary>
        /// Gets all beacon types
        /// </summary>
        /// <returns>BeaconType object list</returns>
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

        /// <summary>
        /// Registers a new beacon type
        /// </summary>
        /// <returns>Bool</returns>
        public async Task<bool> Add()
        {
            if (base.DMLCommand(Procedure.adicionarTipo,
                 new string[,] {
                     {"pNome", this.Name }, {"pTipo", Convert.ToString('b') }
                 }
            ))
            {
               return true;
            }
            return false;
        }

        /// <summary>
        /// Updates a beacon type: its name
        /// </summary>
        /// <returns>Bool</returns>
        public async Task<bool> Update()
        {
            if (base.DMLCommand(Procedure.atualizarTipo,
                 new string[,] {
                     {"pCd", this.Id.ToString() }, {"pNome", this.Name },
                     {"pTipo", Convert.ToString('b') }
                 }
            ))
            {
               return true;
            }
            return false;
        }
        
        /// <summary>
        /// Deletes a beacon type
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Bool</returns>
        public async Task<bool> Delete(int id)
        {
            if (base.DMLCommand(Procedure.deletarTipo,
                 new string[,] {
                     {"pCd", id.ToString() }, {"pTipo", Convert.ToString('b') }
                 }
            ))
            {
               return true;
            }
            return false;
        }

        #endregion

    }
}
