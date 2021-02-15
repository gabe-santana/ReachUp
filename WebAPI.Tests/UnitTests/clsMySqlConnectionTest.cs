using System;
using System.Collections.Generic;
using Xunit;
using System.Text;
using ReachUp;
using System.Threading.Tasks;

namespace BusinessLayer.Tests.UnitTests
{
    public class clsMySqlConnectionTest : clsMySqlConnection
    {
        public clsMySqlConnectionTest() : base() { }

        [Fact]
        public void Connected()
        {
            bool connected = this.Connect();
            Assert.True(connected);
        }

        [Fact]
        public void ConnectionError()
        {
            Assert.Throws<Exception>(() => this.Connect());
        }

        [Fact]
        public void DisconnectionError()
        {
            Assert.Throws<Exception>(() => this.Disconnect());
        }

        [Theory(DisplayName="Os comandos foram executados na base de dados com sucesso")]
        [InlineData("SELECT * from local")]
        [InlineData("SELECT * from local WHERE cd_tipo_local = 1")]
        [InlineData("SELECT * from beacon")]
        public void DMLCommandSuccess(string SqlString)
        {
            bool result = this.DMLCommand(SqlString);
            Assert.True(result);
        }

        [Theory]
        [InlineData("SELECT * from local")]
        [InlineData("SELECT * from local WHERE cd_tipo_local = 1")]
        [InlineData("SELECT * from beacon")]
        public void DMLCommandExecutionError(string SqlString)
        {
            bool result = this.DMLCommand(SqlString);
            Assert.Throws<Exception>(() => this.DMLCommand(SqlString));
        }


    }
}
