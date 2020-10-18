import 'package:ReachUp/View/MapView/Map.view.dart';
import 'package:flutter/material.dart';
     
class HomeMap extends StatefulWidget {

  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  

  @override
  Widget build(BuildContext context) {
    //final map = MapObject();
    
     return Container(

         child: MapView()
       
     );
  }
}
