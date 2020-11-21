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

        /// <summary>
        /// Null constructor
        /// </summary>
        public AdmType() : base() {}

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="name"></param>
        public AdmType(int id, string name) : base()
        {
            this.Id = id;
            this.Name = name;
        }

        /// <summary>
        /// Add constructor
        /// </summary>
        /// <param name="name"></param>
        public AdmType(string name) : base()
        {
            this.Name = name;
        }
        #endregion

        #region Methods

        public async Task<List<AdmType>> GetAll()
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
                        admTypes.Add(
                          new AdmType(
                            int.Parse(this.Data["cd_tipo_administrador"].ToString()),
                             this.Data["nm_tipo_administrador"].ToString()
                          )
                        );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return admTypes;
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        public async Task<bool> Add()
        {
            if (base.DMLCommand(Procedure.adicionarTipo,
                 new string[,] {
                     {"pNome", this.Name }, {"pTipo", "adm" }
                 }
            ))
            {
               return true;
            }
            return false;
        }

        public async Task<bool> Update()
        {
            if (base.DMLCommand(Procedure.atualizarTipo,
                 new string[,] {
                     {"pCd", this.Id.ToString() }, {"pNome", this.Name },
                     {"pTipo",  "adm" }
                 }
            ))
            {
               return true;
            }
            return false;
        }

        public async Task<bool> Delete(int id)
        {
            if (base.DMLCommand(Procedure.deletarTipo,
                 new string[,] {
                     {"pCd", id.ToString() }, {"pTipo", "adm" }
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
