using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class FeedbackType : clsDatabase
    {
        #region Properties
        public int Id {get; set;}
        public string Name {get; set;}
        #endregion

        #region Fields    
        private MySqlDataReader Data = null;
        #endregion

        #region Constructor
        public FeedbackType() : base() { }
        public FeedbackType(int id, string name) : base()
        {
            this.Id = id;
            this.Name = name;
        }

        public FeedbackType(int id) : base()
        {
            this.Id = id;
        }

        public FeedbackType(string name) : base()
        {
            this.Name = name;
        }
        #endregion

        #region Methods

        public Task<List<FeedbackType>> GetAll()
        {
            if (base.DQLCommand(
                "SELECT * from tipo_feedback", ref this.Data
            ))
            {
                List<FeedbackType> feedbackTypes = new List<FeedbackType>();
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        feedbackTypes.Add(new FeedbackType(this.Data["cd_tipo_feedback"].ToString(),
                             this.Data["nm_tipo_feedback"].ToString()));
                    }
                    this.Data.Close();
                }
                base.Disconnect();
                return Task.FromResult(feedbackTypes);
            }
            return null;
        }

        public Task<bool> Post(int id, string name)
        {
            if (base.DMLCommand(
                $"INSERT INTO tipo_feedback VALUES ({id}, {name})", ref this.Data
            ))
            {
               return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        #endregion

    }
}
