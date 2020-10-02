import 'package:ReachUp/Component/Map/Map.component.dart';
import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';

import '../../main.dart';


TapGestureRecognizer tapper =  new TapGestureRecognizer();


class HomeMap extends StatefulWidget {
  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
 

  @override
  Widget build(BuildContext context) {
    final map = MapObject();
     return Container(
       color: Theme.of(context).colorScheme.primaryVariant,
       child: Padding(

         padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
         child: map.widget,
       ),
     );
  }
}
