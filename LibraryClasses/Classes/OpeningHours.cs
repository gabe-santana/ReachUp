using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class OpeningHours
    {
        #region Properties
        public int WeekDay {get; set;}
        public DateTime OpeningTime {get ;set;}
        public DateTime ClosingTime {get; set;}
        #endregion

        #region Constructor
        public OpeningHours(int weekDay, DateTime openingTime, DateTime closingTime)
        {
            this.WeekDay = weekDay;
            this.OpeningTime = openingTime;
            this.ClosingTime = closingTime;
        }
        #endregion
    }
}
