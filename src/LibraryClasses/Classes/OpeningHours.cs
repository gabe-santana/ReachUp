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
        public string OpeningTime {get ;set;}
        public string ClosingTime {get; set;}
        #endregion

        #region Constructor

        /// <summary>
        /// Null constructor
        /// </summary>
        public OpeningHours() {}

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="weekDay"></param>
        /// <param name="openingTime"></param>
        /// <param name="closingTime"></param>
        public OpeningHours(int weekDay, string openingTime, string closingTime)
        {
            this.WeekDay = weekDay;
            this.OpeningTime = openingTime;
            this.ClosingTime = closingTime;
        }
        #endregion
    }
}
