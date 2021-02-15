using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class FeedbackType : clsMySqlConnection
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
        public FeedbackType() : base() {}

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="name"></param>
        public FeedbackType(int id, string name) : base()
        {
            this.Id = id;
            this.Name = name;
        }

        /// <summary>
        /// Add constructor
        /// </summary>
        /// <param name="name"></param>
        public FeedbackType(string name) : base()
        {
            this.Name = name;
        }
        #endregion

        #region Methods

        /// <summary>
        /// Gets all feedback types
        /// </summary>
        /// <returns>FeedbackType object list</returns>
        public Task<List<LocalType>> GetAll()
        {
            if (base.DQLCommand(
                "SELECT * from tipo_feedback", ref this.Data
            ))
            {
                List<LocalType> feedbackTypes = new List<LocalType>();
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        feedbackTypes.Add(
                          new LocalType(
                            int.Parse(this.Data["cd_tipo_feedback"].ToString()),
                            this.Data["nm_tipo_feedback"].ToString()
                          )
                        );
                    }
                    this.Data.Close();
                }
                base.Disconnect();
                return Task.FromResult(feedbackTypes);
            }
            return null;
        }

        /// <summary>
        /// Registers a new feedback type
        /// </summary>
        /// <returns>Bool</returns>
        public async Task<bool> Add()
        {
            if (base.DMLCommand(Procedure.adicionarTipo,
                 new string[,] {
                     {"pNome", this.Name }, {"pTipo", Convert.ToString("f") }
                 }
            ))
            {
               return true;
            }
            return false;
        }

        /// <summary>
        /// Updates a feedback type: its name
        /// </summary>
        /// <returns>Bool</returns>
        public async Task<bool> Update()
        {
            if (base.DMLCommand(Procedure.atualizarTipo,
                 new string[,] {
                     {"pCd", this.Id.ToString() }, {"pNome", this.Name },
                     {"pTipo", Convert.ToString('f') }
                 }
            ))
            {
               return true;
            }
            return false;
        }

        /// <summary>
        /// Deletes a feedback type
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Bool</returns>
        public async Task<bool> Delete(int id)
        {
            if (base.DMLCommand(Procedure.deletarTipo,
                 new string[,] {
                     {"pCd", id.ToString() }, {"pTipo", Convert.ToString('f') }
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
