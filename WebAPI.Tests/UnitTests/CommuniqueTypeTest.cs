using System;
using System.Collections.Generic;
using Xunit;
using System.Text;
using ReachUp;
using System.Threading.Tasks;

namespace BusinessLayer.Tests.UnitTests
{
    public class CommuniqueTypeTest : CommuniqueType
    {
        public CommuniqueTypeTest() : base() { }

        [Fact]
        public void GotAll()
        {
            Task<List<CommuniqueType>> communiqueTypes = this.GetAll();
            Assert.NotNull(communiqueTypes);
        }

        [Fact]
        public void NoDataFoundOrConnectionError()
        {
            Task<List<CommuniqueType>> communiqueTypes = this.GetAll();
            Assert.Null(communiqueTypes);
        }

        [Theory(DisplayName = "O nome do novo tipo de comunicado foi recebido corretamente e o cadastro foi realizado")]
        [InlineData("")]
        public void Added(string name)
        {
            this.Name = name;
            Task<bool> result = this.Add();
            Assert.True(Convert.ToBoolean(result));
        }

        [Theory(DisplayName = "ERRO - O nome do novo tipo de comunicado foi recebido corretamente, porém houve erro no cadastro")]
        [InlineData("")]
        public void NotAdded(string name)
        {
            this.Name = name;
            Task<bool> result = this.Add();
            Assert.False(Convert.ToBoolean(result));
        }
    }
}
