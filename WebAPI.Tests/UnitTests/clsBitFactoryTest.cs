using System;
using System.Collections.Generic;
using Xunit;
using System.Text;
using ReachUp;

namespace BusinessLayer.Tests.UnitTests
{
    public class ClsBitFactoryTest
    {
        [Fact]
        public void GuidCodeGenerated()
        {
            string code = ClsBitFactory.GenerateGuidCode();
            Assert.NotNull(code);
        }

        [Fact]
        public void GuidCodeError()
        {
            Assert.Throws<Exception>(() => ClsBitFactory.GenerateGuidCode());
        }
    }
}
