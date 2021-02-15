using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class LocalType : clsMySqlConnection
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
        public LocalType() : base() {}

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="name"></param>
        public LocalType(int id, string name) : base()
        {
            this.Id = id;
            this.Name = name;
        }

        /// <summary>
        /// Add constructor
        /// </summary>
        /// <param name="name"></param>
        public LocalType(string name) : base()
        {
            this.Name = name;
        }
        #endregion

        #region Methods

        /// <summary>
        /// Gets all local types
        /// </summary>
        /// <returns>LocalType object list</returns>
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
                        localTypes.Add(
                          new LocalType(
                            int.Parse(this.Data["cd_tipo_local"].ToString()),
                            this.Data["nm_tipo_local"].ToString()
                          )
                        );
                    }
                    this.Data.Close();
                }
                base.Disconnect();
                return Task.FromResult(localTypes);
            }
            return null;
        }

        /// <summary>
        /// Registers a new local type
        /// </summary>
        /// <returns>Bool</returns>
        public async Task<bool> Add()
        {
            if (base.DMLCommand(Procedure.adicionarTipo,
                 new string[,] {
                     {"pNome", this.Name }, {"pTipo", Convert.ToString('l') }
                 }
            ))
            {
               return true;
            }
            return false;
        }

        /// <summary>
        /// Updates a local type: its name
        /// </summary>
        /// <returns>Bool</returns>
        public async Task<bool> Update()
        {
            if (base.DMLCommand(Procedure.atualizarTipo,
                 new string[,] {
                     {"pCd", this.Id.ToString() }, {"pNome", this.Name },
                     {"pTipo", Convert.ToString('l') }
                 }
            ))
            {
               return true;
            }
            return false;
        }

        /// <summary>
        /// Deletes a local type
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Bool</returns>
        public async Task<bool> Delete(int id)
        {
            if (base.DMLCommand(Procedure.deletarTipo,
                 new string[,] {
                     {"pCd", id.ToString() }, {"pTipo", Convert.ToString('l') }
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


