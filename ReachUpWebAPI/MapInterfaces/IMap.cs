using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ReachUpWebAPI.MapInterfaces
{


    public static interface IMap
    {
        void FetchLocalPosition();
        object BreedRoute(Position client, Position local);
    }

}

