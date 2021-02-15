using System;
using Xunit;
using ReachUp;
using System.Collections.Generic;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace ReachUp_Tests.UnitTests
{
    public class AdmTypeTest : AdmType
    {
        public AdmTypeTest() : base() {}

        [Fact]
        public void GotAll()
        {
            Task<List<AdmType>> admTypes = this.GetAll();
            Assert.NotNull(admTypes);
        }

        [Fact]
        public void NoDataFoundOrConnectionError()
        {
            Task<List<AdmType>> admTypes = this.GetAll();
            Assert.Null(admTypes);
        }

        [Theory(DisplayName="O nome do novo tipo de adm foi recebido corretamente e o cadastro foi realizado")]
        [InlineData("Desenvolvedor de beacons")]
        public void Added(string name)
        {
            this.Name = name;
            Task<bool> result = this.Add();
            Assert.True(Convert.ToBoolean(result));
        }

        [Theory(DisplayName = "O nome do novo tipo de adm foi recebido corretamente, porém houve erro no cadastro")]
        [InlineData("Desenvolvedor de beacons")]
        public void NotAdded(string name)
        {
            this.Name = name;
            Task<bool> result = this.Add();
            Assert.False(Convert.ToBoolean(result));
        }

    }
}
