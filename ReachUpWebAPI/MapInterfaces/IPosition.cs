using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ReachUpWebAPI.MapInterfaces
{


    public static interface IPosition
    {
        double[] X { get; set; }
        double[] Y { get; set; }
        int floor { get; set; }

        void FigureClientPosition();
        void UpdateClientPosition();
    }


}