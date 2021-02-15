using System;
using System.Collections.Generic;
using Xunit;
using System.Text;
using ReachUp;
using System.Threading.Tasks;

namespace BusinessLayer.Tests.UnitTests
{
    public class LocalTypeTest : LocalType
    {
        public LocalTypeTest() : base() { }

        [Fact]
        public void GotAll()
        {
            Task<List<LocalType>> localTypes = this.GetAll();
            Assert.NotNull(localTypes);
        }

        [Fact]
        public void NoDataFoundOrConnectionError()
        {
            Task<List<LocalType>> localTypes = this.GetAll();
            Assert.Null(localTypes);
        }

        [Theory(DisplayName = "O nome do novo tipo de local foi recebido corretamente e o cadastro foi realizado")]
        [InlineData("")]
        public void Added(string name)
        {
            this.Name = name;
            Task<bool> result = this.Add();
            Assert.True(Convert.ToBoolean(result));
        }

        [Theory(DisplayName = "ERRO - O nome do novo tipo de local foi recebido corretamente, porém houve erro no cadastro")]
        [InlineData("")]
        public void NotAdded(string name)
        {
            this.Name = name;
            Task<bool> result = this.Add();
            Assert.False(Convert.ToBoolean(result));
        }
    }
}
