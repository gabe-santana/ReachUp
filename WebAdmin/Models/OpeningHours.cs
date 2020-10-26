using System;

namespace WebAdmin.Models
{
    public class OpeningHours
    {
        public int WeekDay {get; set;}
        public Time OpeningTime {get ;set;}
        public Time ClosingTime {get; set;}
    }
}