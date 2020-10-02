  
import 'package:ReachUp/Component/Map/Map.component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'Position.component.dart';

class SquareHall extends PositionComponent  with Tapable, HasGameRef<MapObject> {

  Rect hallRect;
  Paint hallPaint;
  Position position;
  Size tileSize = new Size(50,50);

  final Color hallColor = Color(0xFFFFFFFF);


  SquareHall({double x, double y, int floor}){
    position = new Position(x, y, floor);
    hallRect = new Rect.fromLTWH(
      position.x *  this.tileSize.width,
      position.y *  this.tileSize.height,
      this.tileSize.width,
      this.tileSize.height);
    
    hallPaint = new Paint();
    hallPaint.color = hallColor;
  }

 @override
  void render(Canvas canvas){
    canvas.drawRect(hallRect, hallPaint);
  }

 @override
  void update(double t){
   
  }

 @override
  void onTapDown(TapDownDetails details) {
    print("foi");
  }

@override
  void onTapUp(TapUpDetails details) {
     print("foi");
  }
}

