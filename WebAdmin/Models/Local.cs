using System;
using System.Collections.Generic;


namespace WebAdmin.Models
{
    public class Local
    {
        public int Id {get; set;}
        public int Type {get; set;}
        public string Name {get; set;}
        public int Floor {get; set;}
        public DateTime OpeningTime {get; set;}
        public DateTime ClosingTime {get; set;}
    }
}