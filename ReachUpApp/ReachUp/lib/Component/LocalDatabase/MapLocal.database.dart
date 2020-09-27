import 'package:ReachUp/Component/Map/Position.component.dart';
import 'package:meta/meta.dart';

class MapLocal{

  int id;

  Position initialPosition;
  Position endPosition;
  Position beaconIdPosition;

  MapLocal({@required this.initialPosition, @required this.endPosition, @required this.beaconIdPosition});
  
  Map<String, dynamic> toJson(){
    return{
      'initialPosition': this.initialPosition.toJson(),
      'endPosition': this.endPosition.toJson(),
      'beaconIdPosition': this.beaconIdPosition.toJson(),
    };
  }

}