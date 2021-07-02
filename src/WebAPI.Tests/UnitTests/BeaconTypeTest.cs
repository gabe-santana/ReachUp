using System;
using System.Collections.Generic;
using Xunit;
using System.Text;
using ReachUp;
using System.Threading.Tasks;

namespace BusinessLayer.Tests.UnitTests
{
    public class BeaconTypeTest : BeaconType
    {
        public BeaconTypeTest() : base() { }

        [Fact]
        public void GotAll()
        {
            Task<List<BeaconType>> beaconTypes = this.GetAll();
            Assert.NotNull(beaconTypes);
        }

        [Fact]
        public void NoDataFoundOrConnectionError()
        {
            Task<List<BeaconType>> beaconTypes = this.GetAll();
            Assert.Null(beaconTypes);
        }

        [Theory(DisplayName = "O nome do novo tipo de beacon foi recebido corretamente e o cadastro foi realizado")]
        [InlineData("Beacon de vigilância")]
        public void Added(string name)
        {
            this.Name = name;
            Task<bool> result = this.Add();
            Assert.True(Convert.ToBoolean(result));
        }

        [Theory(DisplayName = "ERRO - O nome do novo tipo de beacon foi recebido corretamente, porém houve erro no cadastro")]
        [InlineData("Beacon de vigilância")]
        public void NotAdded(string name)
        {
            this.Name = name;
            Task<bool> result = this.Add();
            Assert.False(Convert.ToBoolean(result));
        }
    }
}
