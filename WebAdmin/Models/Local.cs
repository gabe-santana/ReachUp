using System;

namespace WebAdmin.Models
{
    public class Local
    {
        public int Id {get; set;}
        public int Type {get; set;}
        public string Name {get; set;}
        public int Floor {get; set;}
        public Time OpeningTime {get; set;}
        public Time ClosingTime {get; set;}
    }
}