using System;
using System.Collections.Generic;
using System.Text;

namespace ReachUp
{
    public static class ClsBitFactory
    {
        public static string GenerateGuidCode()
        {
            long i = 1;
            foreach (byte b in Guid.NewGuid().ToByteArray())
            {
                i *= ((int)b + 1);
            }
            return string.Format("{0:x}", i - DateTime.Now.Ticks);
        }
    }
}
