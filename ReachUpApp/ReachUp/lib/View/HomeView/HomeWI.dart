import 'package:flutter/material.dart';

class HomeWI extends StatefulWidget {
  @override
  _HomeWIState createState() => _HomeWIState();
}

class _HomeWIState extends State<HomeWI> {
  @override
  Widget build(BuildContext context) {
    return 
      Drawer(
        child:
        ListView(
          children: [
               Hero(
                tag: "WalkingInfo",
                child: Text("Walking info"),
              )
          ],
        )
     
      );
    
  }
}