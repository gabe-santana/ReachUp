using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class CommuniqueType : ClsMySqlConnection
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
        public CommuniqueType() : base() {}

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="name"></param>
        public CommuniqueType(int id, string name) : base()
        {
            this.Id = id;
            this.Name = name;
        }

        /// <summary>
        /// Add constructor
        /// </summary>
        /// <param name="name"></param>
        public CommuniqueType(string name) : base()
        {
            this.Name = name;
        }
        #endregion

        #region Methods


        /// <summary>
        /// Gets all communique types
        /// </summary>
        /// <returns>CommuniqueType object list</returns>
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

        /// <summary>
        /// Registers a new communique type
        /// </summary>
        /// <returns>Bool</returns>
        public async Task<bool> Add()
        {
            if (base.DMLCommand(Procedure.adicionarTipo,
                 new string[,] {
                     {"pNome", this.Name }, {"pTipo", Convert.ToString('c') }
                 }
            ))
            {
               return true;
            }
            return false;
        }

        /// <summary>
        /// Updates a communique type: its name
        /// </summary>
        /// <returns>Bool</returns>
        public async Task<bool> Update()
        {
            if (base.DMLCommand(Procedure.atualizarTipo,
                 new string[,] {
                     {"pCd", this.Id.ToString() }, {"pNome", this.Name },
                     {"pTipo", Convert.ToString('c') }
                 }
            ))
            {
               return true;
            }
            return false;
        }
        
        /// <summary>
        /// Deletes a communique type
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Bool</returns>
        public async Task<bool> Delete(int id)
        {
            if (base.DMLCommand(Procedure.deletarTipo,
                 new string[,] {
                     {"pCd", id.ToString() }, {"pTipo", Convert.ToString('c') }
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
