using System;
using System.Collections.Generic;
using Xunit;
using System.Text;
using ReachUp;

namespace BusinessLayer.Tests.UnitTests
{
    public class clsBitFactoryTest
    {
        [Fact]
        public void GuidCodeGenerated()
        {
            string code = clsBitFactory.GenerateGuidCode();
            Assert.NotNull(code);
        }

        [Fact]
        public void GuidCodeError()
        {
            Assert.Throws<Exception>(() => clsBitFactory.GenerateGuidCode());
        }
    }
}
