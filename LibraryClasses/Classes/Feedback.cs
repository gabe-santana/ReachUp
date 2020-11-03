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
        public User FeedbackUser { get; set; }
        public string Description { get; set; }
        public DateTime FeedbackDate { get; set; }
        public ushort Stars { get; set; }
        #endregion

        #region Fields
        MySqlDataReader Data = null;
        #endregion

        #region Constructor
        public Feedback() : base() { }

        public Feedback(User FeedbackUser, string Description, DateTime FeedbackDate,
             ushort Stars) : base()
        {
            this.FeedbackUser = FeedbackUser;
            this.Description = Description;
            this.FeedbackDate = FeedbackDate;
            this.Stars = Stars;
        }
        #endregion

        #region Methods
        public async Task<List<Feedback>> GetAll(int type)
        {
            if (base.DQLCommand(Procedure.acessoFeedbacks, ref this.Data,
                new string[,] {
                    {"pTipo", type.ToString() }, {"dataInicio", null}, {"dataFim", null},
                    {"pGeral", "1"}
                }))
            {
                List<Feedback> feedbacks = new List<Feedback>();
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        feedbacks.Add(new Feedback(
                                await new User().Get("cli", this.Data["nm_email_cliente"].ToString()),
                                this.Data["ds_feedback"].ToString(),
                                DateTime.Parse(this.Data["dt_feedback"].ToString()),
                                ushort.Parse(this.Data["qt_estrelas_feedback"].ToString())
                            ));
                    }

                    this.Data.Close();
                    base.Disconnect();
                    return await Task.FromResult(feedbacks);
                }

                this.Data.Close();
                base.Disconnect();
            }

            return null;
        }

        public async Task<List<Feedback>> ByDate(int type, string begin, string end)
        {
            if (base.DQLCommand(Procedure.acessoFeedbacks, ref this.Data,
                new string[,] {
                    {"pTipo", type.ToString() }, {"dataInicio", begin.ToString()}, {"dataFim", end.ToString()},
                    {"pGeral", "0"}
                }))
            {
                List<Feedback> feedbacks = new List<Feedback>();
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        feedbacks.Add(new Feedback(
                                await new User().Get("cli", this.Data["nm_email_cliente"].ToString()),
                                this.Data["ds_feedback"].ToString(),
                                DateTime.Parse(this.Data["dt_feedback"].ToString()),
                                ushort.Parse(this.Data["qt_estrelas_feedback"].ToString())
                            ));
                    }
                    return await Task.FromResult(feedbacks);
                }

                this.Data.Close();
                base.Disconnect();
            }

            return null;
        }

        public async Task<List<Feedback>> ByUser(string email) 
        {
            if (base.DQLCommand(Procedure.FeedbackPorCliente, ref this.Data, new string[,] {
                {"pEmail", email}
            })) 
            {
                List<Feedback> feedbacks = new List<Feedback>();
                if (this.Data.HasRows)
                {
                    while (this.Data.Read()) 
                    {
                        feedbacks.Add(
                                new Feedback(
                                        await new User().Get("cli", this.Data["nm_email_cliente"].ToString()),
                                        this.Data["ds_feedback"].ToString(),
                                        DateTime.Parse(this.Data["dt_feedback"].ToString()),
                                        ushort.Parse(this.Data["qt_estrelas_feedback"].ToString())
                                    )
                            );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return await Task.FromResult(feedbacks);
                }
                this.Data.Close();
                base.Disconnect();
            }

            return null;
        }

        public async Task<Feedback> Get(int id, int type) 
        {
            if (base.DQLCommand(Procedure.pegarFeedback, ref this.Data, new string[,] {
                {"pFeedback", id.ToString()},
                {"pTipo", type.ToString()}
            }))
            {
                Feedback feedback = null;
                if (this.Data.HasRows)
                {
                    while (this.Data.Read()) 
                    {
                        feedback = new Feedback(
                                await new User().Get("cli", this.Data["nm_email_cliente"].ToString()),
                                this.Data["ds_feedback"].ToString(),
                                DateTime.Parse(this.Data["dt_feedback"].ToString()),
                                ushort.Parse(this.Data["qt_estrelas_feedback"].ToString())
                            );
                    }
                }

                this.Data.Close();
                base.Disconnect();

                return await Task.FromResult(feedback);
            }
            return null;
        }
        public Task<bool> Update()
        {
            if (base.DMLCommand(Procedure.atualizarFeedback, new string[,] {
                {"pFeedback", this.FeedbackId.ToString() },
                {"pTipo", this.Type.ToString()},
                {"pEmail", this.FeedbackUser.Email},
                {"pDs", this.Description},
                {"pQt", this.Stars.ToString()}
            })) 
            {
                return  Task.FromResult(true);
            }
            return  Task.FromResult(false);
        }

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

        public Task<bool> Delete(int id)
        {
            if (base.DMLCommand(Procedure.deletarFeedback, new string[,] {
                {"pFeedback", id.ToString()}
            }))
            {
                return Task.FromResult(true);

            }
            return Task.FromResult(false);
        }

        /*public Task<int> GetAverage(DateTime startDate, DateTime endDate, bool isGeneral)
        {
           int average;

            if (base.DQLCommand(Procedure.mediaFeedbacks, ref this.Data,
                new string[,] {
                    {"dataInicio", startDate.ToString() },
                    {"dataFim", endDate.ToString() },
                    {"pGeral", isGeneral.ToString() },
                }))
                {
                  if (this.Data.HasRows)
                  {
                    if (this.Data.Read())
                    {
                        average = int.Parse(this.Data["media"].ToString());
                    }

                    this.Data.Close();
                    base.Disconnect();
                    return Task.FromResult(average);
                  }

                this.Data.Close();
                base.Disconnect();
            }

            return Task.FromResult(-1);
        }*/

            #endregion

    }
}
