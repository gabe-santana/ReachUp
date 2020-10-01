import 'dart:ui';
import 'package:ReachUp/Component/Map/Hall.component.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flame/gestures.dart';


class MapObject extends BaseGame with PanDetector, HasTapableComponents {
  MapObject(){
    for (double i = 0; i < 10; i++) {
      add(SquareHall(x:1, y:i, floor:0));

    }

  }

}
