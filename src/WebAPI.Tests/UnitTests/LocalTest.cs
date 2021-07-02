using System;
using System.Collections.Generic;
using Xunit;
using System.Text;
using ReachUp;
using System.Threading.Tasks;


namespace BusinessLayer.Tests.UnitTests
{
    public class LocalTest : Local
    {
        public LocalTest() : base() { }

        [Theory]
        [InlineData(0)]
        [InlineData(1)]
        [InlineData(2)]
        [InlineData(7)]
        public void GotAllByType(int type)
        {
            Task<List<Local>> locals = this.GetAll(type);
            Assert.NotNull(locals);
        }

        [Theory(DisplayName="Busca com resultados encontrados")]
        [InlineData("Americanas")]
        [InlineData("Mc Donald's")]
        [InlineData("Samsung")]
        [InlineData("A")]
        public void SearchSuccess(string search)
        {
            Task<List<Local>> locals = this.Search(search);
            Assert.NotNull(locals);
        }

        [Theory(DisplayName="Busca sem resultados encontrados")]
        [InlineData(" ")]
        [InlineData("Walmart")]
        public void NoResultFoundOnSearch(string search)
        {
            Task<List<Local>> locals = this.Search(search);
            Assert.Null(locals);
        }

        [Theory(DisplayName= "Busca com resultados encontrados")]
        [InlineData("Americanas")]
        [InlineData("Mc Donald's")]
        [InlineData("Samsung")]
        [InlineData("A")]
        public void SeekSuccess(string search)
        {
            Task<List<Local>> locals = this.Seek(search);
            Assert.NotNull(locals);
        }

        [Theory(DisplayName = "Busca sem resultados encontrados")]
        [InlineData(" ")]
        [InlineData("Walmart")]
        public void NoResultFoundOnSeek(string search)
        {
            Task<List<Local>> locals = this.Seek(search);
            Assert.Null(locals);
        }
    }
}
