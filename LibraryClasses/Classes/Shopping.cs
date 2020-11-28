using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class Shopping : clsDatabase
    {
        #region Properties

        public int Id { get; set; }
        public string Name { get; set; }
        public string Message { get; set; }
        public OpeningHours OpeningHours { get; set; }
        public List<OpeningHours> List_OpeningHours { get; set; }

        #endregion

        #region Fields

        private MySqlDataReader Data = null;

        #endregion

        #region Constructors

        /// <summary>
        /// Null constructor
        /// </summary>
        public Shopping() : base () { }

        /// <summary>
        /// Default constructor.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="name"></param>
        /// <param name="message"></param>
        /// <param name="listOpeningHours"></param>
        public Shopping(int id, string name, string message, List<OpeningHours> listOpeningHours = null) : base()
        {
            this.Id = id;
            this.Name = name;
            this.Message = message;
            this.List_OpeningHours = listOpeningHours;
        }

        /// <summary>
        /// Update constructor
        /// </summary>
        /// <param name="name"></param>
        /// <param name="message"></param>
        public Shopping(string name, string message) : base()
        {
            this.Name = name;
            this.Message = message;
        }

        /// <summary>
        /// Define/Update opening hours constructor
        /// </summary>
        /// <param name="shoppingId"></param>
        /// <param name="openingHours"></param>
        public Shopping(int id, OpeningHours openingHours = null) :base()
        {
            this.Id = id;
            this.OpeningHours = openingHours;
        }

        #endregion

        #region Public Methods.


        /// <summary>
        /// Get the shopping
        /// </summary>
        /// <returns>Shopping object</returns>
        public Task<Shopping> Get(int id)
        {
            if (base.DQLCommand(Procedure.pegarInfoShopping, ref this.Data,
                new string[,]{
                    {"pShopping", id.ToString()}
                }
            ))
            {
                if (this.Data.HasRows)
                {
                    Shopping shopping = null;
                    List<OpeningHours> listOpeningHours = null;
                    if (this.Data.Read())
                    {
                        string[] horas = this.Data["horarios_funcionamento"].ToString().Split(',');

                        for (int i = 0; i < horas.Length; i++)
                        {
                            listOpeningHours.Add(
                                new OpeningHours(
                                    int.Parse(horas[i].Substring(0, 1)),
                                    horas[i].Substring(2, 8),
                                    horas[i].Substring(11, 8)
                                )
                            );
                        }

                        shopping = new Shopping(
                            int.Parse(this.Data["cd_shopping"].ToString()),
                            this.Data["nm_shopping"].ToString(),
                            this.Data["ds_mensagem"].ToString(),
                            listOpeningHours
                        );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return Task.FromResult(shopping);
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Updates the shopping's opening hours, on a specific weekday
        /// </summary>
        /// <returns>Bool</returns>
        public Task<bool> UpdateOpeningHours()
        {
            if (base.DMLCommand(Procedure.defHorarioShopping, new string[,] {
                {"pDia", this.OpeningHours.WeekDay.ToString() },
                {"pAbertura", this.OpeningHours.OpeningTime.ToString() },
                {"pFechamento", this.OpeningHours.ClosingTime.ToString() }
               }))
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        /// <summary>
        /// Updates the mall name and/or welcome message
        /// </summary>
        /// <returns>Bool</returns>
        public Task<bool> Update()
        {
            if (base.DMLCommand(Procedure.atualizarShopping,
                new string[,] {
                    {"pNome", this.Name },
                    {"pMensagem", this.Message }
                }
              ))
              {
                return Task.FromResult(true);
              }
              return Task.FromResult(false);
        }

        #endregion
    }
}
