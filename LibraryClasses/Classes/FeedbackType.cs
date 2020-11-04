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
                        feedbackTypes.Add(
                          new FeedbackType(
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

        public Task<bool> Add()
        {
            if (base.DQLCommand(
                $"SELECT COUNT(*) as Count FROM tipo_feedback",
                ref this.Data
            ))
            {
                int Count = 0;
                while (this.Data.Read()) 
                {
                   Count = int.Parse(this.Data["Count"].ToString());
                }

               if (base.DMLCommand(
                $"INSERT INTO tipo_feedback VALUES ({Count}, {this.Name})"
                ))
                {
                   this.Data.Close();
                   base.Disconnect();
                   return Task.FromResult(true);
                }
                this.Data.Close();
                base.Disconnect();
                return Task.FromResult(false);
            }
            this.Data.Close();
            base.Disconnect();
            return Task.FromResult(false);
        }

        public Task<bool> Update()
        {
            if (base.DMLCommand(
                $"UPDATE tipo_feedback SET nm_tipo_feedback={this.Name} WHERE cd_tipo_feedback={this.Id}"
            ))
            {
               return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        public Task<bool> Delete(int id)
        {
            if (base.DMLCommand(
                $"DELETE FROM feedback WHERE cd_tipo_feedback={id}"
            ))
            {
               if (base.DMLCommand(
                   $"DELETE FROM tipo_feedback WHERE cd_tipo_feedback={id}"
               ))
               {
                  return Task.FromResult(true);
               }
               return Task.FromResult(false);
            }
            return Task.FromResult(false);
        }

        #endregion

    }
}
