import 'dart:math';
import 'Position.component.dart';


class Mapper{
  double metersByUnit = 1; 

  getUserPosition(Position a, Position b, Position c, double dA, double dB, double dC){

        var cogX = (a.x + b.x + c.x) / 3;
        var cogY = (a.y + b.y + c.y) / 3;
        var cog = new Position(cogX, cogY, a.floor);

    
        Position nearestBeacon;
        double shortestDistanceInMeters;

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

        var distanceToCog =  (sqrt(pow(cog.x - nearestBeacon.x, 2)
                + pow(cog.y - nearestBeacon.y, 2)));


        var shortestDistanceInCoordinationUnits = shortestDistanceInMeters * metersByUnit;

        var t = shortestDistanceInCoordinationUnits / distanceToCog;
        var pointsDiff = new Position(cog.x - nearestBeacon.x, cog.y - nearestBeacon.y, a.floor);
        var tTimesDiff = new Position(pointsDiff.x * t, pointsDiff.y * t, a.floor);

        var userLocation = new Position(nearestBeacon.x + tTimesDiff.x, nearestBeacon.y + tTimesDiff.y, a.floor);

        return userLocation;
    
  }
}

