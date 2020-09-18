using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace ReachUpWebAPI.MapModels
{
    public class Position
    {
        public float X { get; set; }
        public float Y { get; set; }
        public int Floor { get; set; }

        public Position() { }
        public Position(float X, float Y)
        {
            this.X = X;
            this.Y = Y;
        }

        /* [Reachup Note] Hey, peopleware checking our code... DON'T GIVE UP NOW!
           What comes next are simple algorithms that easily calculate the distance among four points,
           using analytical geometry. What about? - Guilherme Djrdjrjan */

        public static Position GetMoveblePosition(Position a, Position b, Position c,
            float dA, float dB, float dC)
        {
            float METERS_IN_COORDINATE_UNITS_RATIO = 1.0f;

            //Find Center of Gravity
            float cogX = (a.X + b.X + c.X) / 3;
            float cogY = (a.Y + b.Y + c.Y) / 3;
            Position cog = new Position(cogX, cogY);

            //Nearest Beacon
            Position nearestBeacon;
            float shortestDistanceInMeters;
            if (dA < dB && dA < dC)
            {
                nearestBeacon = a;
                shortestDistanceInMeters = dA;
            }
            else if (dB < dC)
            {
                nearestBeacon = b;
                shortestDistanceInMeters = dB;
            }
            else
            {
                nearestBeacon = c;
                shortestDistanceInMeters = dC;
            }

            //Distance between nearest beacon and COG
            float distanceToCog = (float)(Math.Sqrt(Math.Pow(cog.X - nearestBeacon.X, 2)
                    + Math.Pow(cog.Y - nearestBeacon.Y, 2)));

            //Convert shortest distance in meters into coordinates units.
            float shortestDistanceInCoordinationUnits = shortestDistanceInMeters * METERS_IN_COORDINATE_UNITS_RATIO;

            //On the line between Nearest Beacon and COG find shortestDistance point apart from Nearest Beacon
            float t = shortestDistanceInCoordinationUnits / distanceToCog;
            Position pointsDiff = new Position(cog.X - nearestBeacon.X, cog.Y - nearestBeacon.Y);
            Position tTimesDiff = new Position(pointsDiff.X * t, pointsDiff.Y * t);

            //Add t times diff with nearestBeacon to find coordinates at a distance from nearest beacon in line to COG.
            Position userLocation = new Position(nearestBeacon.X + tTimesDiff.X, nearestBeacon.Y + tTimesDiff.Y);

            return userLocation;
        }

    }
}
