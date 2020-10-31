using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace WebAdmin.Models
{
    public class Communique
    {
        public int CommuniqueId { get; set; }
        [JsonIgnore] public ushort Type { get; set; }
        public Local CommuniqueLocal { get; set; }
        public List<SubCategory> CommuniqueSubCategory = new List<SubCategory>();
        public string Description { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
    }
}