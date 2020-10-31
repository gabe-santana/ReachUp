using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WebAdmin.Models
{
    public class OpeningHours
    {
        public int WeekDay {get; set;}
        public DateTime OpeningTime {get ;set;}
        public DateTime ClosingTime {get; set;}
    }
}