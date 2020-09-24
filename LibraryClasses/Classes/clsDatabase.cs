using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;

namespace ReachUp
{
    public class clsDatabase
    {
        #region Properties
        private MySqlCommand mSqlCommand = null;
        private MySqlConnection mSqlConnection = new MySqlConnection(clsConnectionString.getConnectionString());
        private string ErrorMessage { get; set; }
        #endregion

        #region StoredProcedures
        [System.Flags]
        public enum Procedure
        {
            cadastrarUsuario,
            logarUsuario,
            cadastrarCategoria,
            removerCategoria,
            cadastrarSubCategoria,
            definirPreferencia,
            clientePrefere,
            criarFeedback,
            deletarFeedback,
            pegarFeedback,
            FeedbackPorCliente,
            atualizarFeedback,
            conectarBeacon,
            receberComunicados,
            receberAlertas,
            pesquisar,
            cadastrarLocal,
            pegarSubcategoriasLocal,
            darAdm,
            publicarComunicado,
            definirCategoria,
            cadastrarBeacon,
            acessoFeedbacks,
            mediaFeedbacks,
            pegarUsuarios,
            pegarUsuario,
            deletarUsuario,
            atualizarUsuario,
            pegarLocal,
            pegarLocais,
            atualizarLocal,
            deletarLocal,
            pegarBeacon,
            pegarBeacons,
            deletarBeacon,
            lojistasLoja,
            pegarCategoria,
            atualizarBeacon,
            pegarComunicados,
            atualizarComunicado,
            deletarComunicado
        }

        #endregion

        #region Constructor
        public clsDatabase()
        {

        }
        #endregion

        #region Public Methods
        /// <summary>
        /// Connect to Database
        /// </summary>
        /// <returns>Sucessful</returns>
        public bool Connect()
        {
            if (this.mSqlConnection.State != ConnectionState.Open)
            {
                try
                {
                    this.mSqlConnection.Open();
                }
                catch (MySqlException e)
                {
                    this.ErrorMessage = e.ToString();
                    return false;
                }
                return true;
            }
            return false;
        }

        /// <summary>
        /// Disconnect to Database
        /// </summary>
        /// <returns>Void</returns>
        public void Disconnect()
        {
            if (this.mSqlConnection.State != ConnectionState.Closed)
            {
                this.mSqlConnection.Close();
            }
        }

        /// <summary>
        /// Execute DML Command without SP
        /// </summary>
        /// <param name="SqlString">Sql Command</param>
        /// <returns>Sucessful</returns>
        public bool DMLCommand(string SqlString)
        {
            if (this.Connect())
            {
                this.mSqlCommand = new MySqlCommand(SqlString, this.mSqlConnection);
                try
                {
                    this.mSqlCommand.ExecuteNonQuery();
                }
                catch (MySqlException ex)
                {
                    this.ErrorMessage = ex.ToString();
                    this.Disconnect();
                    return false;
                }

                this.Disconnect();
                return true;
            }
            this.ErrorMessage = "Connection Error";
            return false;
        }

        /// <summary>
        /// Execute DML Command with SP // Auto Disconnect 
        /// </summary>
        /// <param name="ProcedureName">Procedure name</param>
        /// <param name="Parameters">Array of Procedure parameters </param>
        /// <returns>Sucessful</returns>
        public bool DMLCommand(Procedure ProcedureName, string[,] Parameters = null)
        {
            if (this.Connect())
            {
                this.mSqlCommand = new MySqlCommand(ProcedureName.ToString(), this.mSqlConnection);
                this.mSqlCommand.CommandType = CommandType.StoredProcedure;
                this.mSqlCommand.Parameters.Clear();

                if (Parameters != null)
                {
                    for (int i = 0; i < Parameters.Length / 2; i++)
                    {
                        this.mSqlCommand.Parameters.AddWithValue(Parameters[i, 0], Parameters[i, 1]);
                    }
                    try
                    {
                        this.mSqlCommand.ExecuteNonQuery();
                    }
                    catch (MySqlException ex)
                    {

                        this.ErrorMessage = ex.ToString();
                        this.Disconnect();
                        return false;
                    }
                 
                    this.Disconnect();
                    return true;
                }
                this.ErrorMessage = "StoredProcedure parameters are null";
                return false;
            }
            this.ErrorMessage = "Connection Error";
            return false;
        }


        /// <summary>
        /// Execute DQL Command without SP // Auto Disconnect 
        /// </summary>
        /// <param name="SqlString">Sql Command</param>
        /// <param name="Data">Data Reference</param>
        /// <returns>Sucessful</returns>
        public bool DQLCommand(string SqlString, ref MySqlDataReader Data)
        {
            if (this.Connect())
            {
                this.mSqlCommand = new MySqlCommand(SqlString, this.mSqlConnection);
                try
                {
                    Data = this.mSqlCommand.ExecuteReader();
                }
                catch (MySqlException ex)
                {

                    this.ErrorMessage = ex.ToString();
                    this.Disconnect();
                    return false;
                }
               
                return true;
            }
            this.ErrorMessage = "Connection Error";
            return false;
        }

        /// <summary>
        /// Execute DQL Command with SP
        /// </summary>
        /// <param name="ProcedureName">Procedure name</param>
        /// <param name="Data">Data Reference</param>
        /// <param name="Parameters">Array of Procedure parameters </param>
        /// <returns>Sucessful</returns>
        public bool DQLCommand(Procedure ProcedureName, ref MySqlDataReader Data, string[,] Parameters = null)
        {
            if (this.Connect())
            {
                this.mSqlCommand = new MySqlCommand(ProcedureName.ToString(), this.mSqlConnection);
                this.mSqlCommand.CommandType = CommandType.StoredProcedure;
                this.mSqlCommand.Parameters.Clear();

                if (Parameters != null)
                {
                    for (int i = 0; i < Parameters.Length / 2; i++)
                    {
                        this.mSqlCommand.Parameters.AddWithValue(Parameters[i, 0], Parameters[i, 1]);
                    }
                    try
                    {
                        Data = this.mSqlCommand.ExecuteReader();
                    }
                    catch (MySqlException ex)
                    {
                        this.ErrorMessage = ex.ToString();
                        this.Disconnect();
                        return false;
                    }
            
                    return true;
                }
                this.ErrorMessage = "StoredProcedure parameters are null";
                return false;
            }
            this.ErrorMessage = "Connection Error";
            return false;
        }

        #endregion
    }
}