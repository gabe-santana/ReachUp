import 'dart:ui';
import 'package:ReachUp/Component/Map/Plan.component.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MapObject extends Game{
  Plan plan;

  MapObject() {
     this.plan = new Plan();
      this.plan.x = -520;
      this.plan.y = -210;
      this.plan.width *=   30;
      this.plan.height *=   15;  

  }

  @override
  void render(Canvas canvas) async{
     this.plan.render(canvas);
  }
  
  @override
  void update(double t) {}
}
