import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MapObject extends Game{

  Size screenSize;

  MapObject() {

  }

  @override
  void render(Canvas canvas) async{
    canvas.drawRect(
      new Rect.fromLTWH(0,0,100,100), new Paint()..color= Color(0xFFf54278));
  }
  
  @override
  void update(double t) {}

  @override 
  void resize(Size size){
    super.resize(size);
    screenSize = size;

  }
}
