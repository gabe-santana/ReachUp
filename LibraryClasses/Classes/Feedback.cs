using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace ReachUp
{
    public class Feedback : clsDatabase
    {
        #region Properties
        [JsonIgnore] public int FeedbackId { get; set; }
        [JsonIgnore] public ushort Type { get; set; }
        public string TypeName {get; set; }
        public User FeedbackUser { get; set; }
        public string Description { get; set; }
        public string FeedbackDate { get; set; }
        public ushort Stars { get; set; }
        #endregion

        #region Fields
        MySqlDataReader Data = null;
        #endregion

        #region Constructor

        /// <summary>
        /// Null constructor
        /// </summary>
        public Feedback() : base() {}

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="FeedbackUser"></param>
        /// <param name="Description"></param>
        /// <param name="FeedbackDate"></param>
        /// <param name="Stars"></param>
        /// <param name="type"></param>>
        public Feedback(User FeedbackUser, string Description, string FeedbackDate,
             ushort Stars, ushort type) : base()
        {
            this.FeedbackUser = FeedbackUser;
            this.Description = Description;
            this.FeedbackDate = FeedbackDate.Substring(0, 10);
            this.Stars = Stars;
            this.Type = type;
        }

         /// <summary>
        ///  Get by user constructor
        /// </summary>
        /// <param name="feedbackUser"></param>
        /// <param name="description"></param>
        /// <param name="date"></param>
        /// <param name="stars"></param>
        /// <param name="type"></param>
        /// <param name="id"></param>
        /// <param name="typeName"></param>
         public Feedback(User FeedbackUser, string Description, string FeedbackDate,
             ushort Stars, ushort type, int id, string typeName) : base()
         {
            this.FeedbackUser = FeedbackUser;
            this.Description = Description;
            this.FeedbackDate = FeedbackDate.Substring(0, 10);
            this.Stars = Stars;
            this.Type = type;
            this.FeedbackId = id;
            this.TypeName = typeName;
        }

        /// <summary>
        ///  Get by user constructor
        /// </summary>
        /// <param name="feedbackUser"></param>
        /// <param name="description"></param>
        /// <param name="date"></param>
        /// <param name="stars"></param>
        /// <param name="type"></param>
        /// <param name="id"></param>
        /// <param name="typeName"></param>
         public Feedback(User FeedbackUser, string Description, string FeedbackDate,
             ushort Stars, ushort type, string typeName) : base()
         {
            this.FeedbackUser = FeedbackUser;
            this.Description = Description;
            this.FeedbackDate = FeedbackDate.Substring(0, 10);
            this.Stars = Stars;
            this.Type = type;
            this.TypeName = typeName;
        }

         /// <summary>
        ///  Get by key (type + id) constructor
        /// </summary>
        /// <param name="feedbackUser"></param>
        /// <param name="description"></param>
        /// <param name="date"></param>
        /// <param name="stars"></param>
         public Feedback(User FeedbackUser, string Description, string FeedbackDate,
             ushort Stars) : base()
         {
            this.FeedbackUser = FeedbackUser;
            this.Description = Description;
            this.FeedbackDate = FeedbackDate.Substring(0, 10);
            this.Stars = Stars;
        }

        /// <summary>
        ///  Add constructor
        /// </summary>
        /// <param name="type"></param>
        /// <param name="feedbackUser"></param>
        /// <param name="description"></param>
        /// <param name="stars"></param>
        public Feedback(ushort type, User feedbackUser, string description, ushort stars) 
         : base()
        {
            this.Type = type;
            this.FeedbackUser = feedbackUser;
            this.Description = description;
            this.Stars = stars;
        }

        /// <summary>
        ///  Update constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="type"></param>
        /// <param name="description"></param>
        /// <param name="stars"></param>
        public Feedback(int id, ushort type, string description, ushort stars) 
         : base()
        {
            this.FeedbackId = id;
            this.Type = type;
            this.Description = description;
            this.Stars = stars;
        }
        #endregion

        #region Methods

        /// <summary>
        /// Gets all feedbacks of a type
        /// </summary>
        /// <param name="type"></param>
        /// <returns>Feedback object list</returns>
        public async Task<List<Feedback>> GetAll(int type)
        {
            if (base.DQLCommand(Procedure.acessoFeedbacks, ref this.Data,
                new string[,] {
                    {"pTipo", type.ToString() }, {"dataInicio", null}, {"dataFim", null},
                    {"pGeral", "1"}
                }))
            {
                if (this.Data.HasRows)
                {
                    List<Feedback> feedbacks = new List<Feedback>();

                    while (this.Data.Read())
                    {
                        feedbacks.Add(
                            new Feedback(
                           await new User().Get("cli", 
                             this.Data["nm_email_cliente"].ToString()),
                           this.Data["ds_feedback"].ToString(),
                           this.Data["dt_feedback"].ToString(),
                           ushort.Parse(this.Data["qt_estrelas_feedback"].ToString()),
                           ushort.Parse(this.Data["cd_tipo_feedback"].ToString()),
                            this.Data["nm_tipo_feedback"].ToString()
                            )
                        );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return await Task.FromResult(feedbacks);
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Gets all feedbacks of a type, that were made within a period of time
        /// </summary>
        /// <param name="type"></param>
        /// <param name="begin"></param>
        /// <param name="end"></param>
        /// <returns>Feedback object list</returns>
        public async Task<List<Feedback>> ByDate(int type, string begin, string end)
        {
            if (base.DQLCommand(Procedure.acessoFeedbacks, ref this.Data,
                new string[,] {
                    {"pTipo", type.ToString() }, {"dataInicio", begin.ToString()}, {"dataFim", end.ToString()},
                    {"pGeral", "0"}
                }))
            {
                if (this.Data.HasRows)
                {
                    List<Feedback> feedbacks = new List<Feedback>();

                    while (this.Data.Read())
                    {
                        feedbacks.Add(
                            new Feedback(
                                await new User().Get("cli", 
                                  this.Data["nm_email_cliente"].ToString()),
                                this.Data["ds_feedback"].ToString(),
                                this.Data["dt_feedback"].ToString(),
                                ushort.Parse(this.Data["qt_estrelas_feedback"].ToString()),
                                ushort.Parse(this.Data["cd_tipo_feedback"].ToString()),
                                this.Data["nm_tipo_feedback"].ToString()
                            )
                        );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return await Task.FromResult(feedbacks);
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Gets all feedbacks of a client
        /// </summary>
        /// <param name="email"></param>
        /// <returns>Feedback object list</returns>
        public async Task<List<Feedback>> ByUser(string email) 
        {
            if (base.DQLCommand(Procedure.FeedbackPorCliente, ref this.Data, new string[,] {
                {"pEmail", email}
            })) 
            {
                if (this.Data.HasRows)
                {
                    List<Feedback> feedbacks = new List<Feedback>();

                    while (this.Data.Read()) 
                    {
                        feedbacks.Add(
                            new Feedback(
                              await new User().Get("cli", 
                                this.Data["nm_email_cliente"].ToString()),
                              this.Data["ds_feedback"].ToString(),
                              this.Data["dt_feedback"].ToString(),
                              ushort.Parse(this.Data["qt_estrelas_feedback"].ToString()),
                              ushort.Parse(this.Data["cd_tipo_feedback"].ToString()),
                              int.Parse(this.Data["cd_feedback"].ToString()),
                              this.Data["nm_tipo_feedback"].ToString()
                                )
                            );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return await Task.FromResult(feedbacks);
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Gets a feedback from its concatenated key
        /// </summary>
        /// <param name="id"></param>
        /// <param name="type"></param>
        /// <returns>Feedback object</returns>
        public async Task<Feedback> Get(int id, int type) 
        {
            if (base.DQLCommand(Procedure.pegarFeedback, ref this.Data, new string[,] {
                {"pFeedback", id.ToString()},
                {"pTipo", type.ToString()}
            }))
            {
                if (this.Data.HasRows)
                {
                    Feedback feedback = null;

                    while (this.Data.Read()) 
                    {
                        feedback = new Feedback(
                           await new User().Get("cli", 
                            this.Data["nm_email_cliente"].ToString()),
                           this.Data["ds_feedback"].ToString(),
                           this.Data["dt_feedback"].ToString(),
                           ushort.Parse(this.Data["qt_estrelas_feedback"].ToString())
                        );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return await Task.FromResult(feedback);
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Registers a feedback
        /// </summary>
        /// <returns>Bool</returns>
        public Task<bool> Add() 
        {
            if (base.DMLCommand(Procedure.criarFeedback, new string[,] {
                  {"pTipo", this.Type.ToString()},
                  {"pEmail", this.FeedbackUser.Email},
                  {"pDs", this.Description},
                  {"pQt", this.Stars.ToString() }
            }))
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        /// <summary>
        /// Updates a feedback
        /// </summary>
        /// <returns>Bool</returns>
        public Task<bool> Update()
        {
            if (base.DMLCommand(Procedure.atualizarFeedback, new string[,] {
                {"pFeedback", this.FeedbackId.ToString() },
                {"pTipo", this.Type.ToString()},
                {"pDs", this.Description},
                {"pQt", this.Stars.ToString()}
            })) 
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        /// <summary>
        /// Deletes a feedback
        /// </summary>
        /// <param name="id"></param>
        /// <param name="type"></param>
        /// <returns>Bool</returns>
        public Task<bool> Delete(int id, int type)
        {
            if (base.DMLCommand(Procedure.deletarFeedback, new string[,] {
                {"pFeedback", id.ToString()},
                {"pTipo", type.ToString()}
            }))
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }
        #endregion
    }
}
