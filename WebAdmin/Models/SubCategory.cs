using System;

namespace WebAdmin.Models
{
    public class SubCategory
    {
        public int SubCategoryId { get; set; }
        public Category Category { get;set; }
        public string SubCategoryName { get; set; }
    }
}