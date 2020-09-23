using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class SubCategory : clsDatabase
    {
        private int SubCategoryId { get; set; }
        public Category Category { get;set; }
        public string SubCategoryName { get; set; }
        public SubCategory() : base() { }

        public SubCategory(int Id, Category Category, string Name) : base() 
        {
            this.SubCategoryId = Id;
            this.Category = Category;
            this.SubCategoryName = Name;
        }
    }
}
