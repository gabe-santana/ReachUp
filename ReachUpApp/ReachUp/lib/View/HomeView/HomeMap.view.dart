import 'package:ReachUp/Component/Map/Map.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photo_view/photo_view.dart';


class HomeMap extends StatefulWidget {
  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
 bool enableRotation = true;

  @override
  Widget build(BuildContext context) {
    final map = MapObject();
     return Container(
       color: Theme.of(context).colorScheme.primaryVariant,
       child: Padding(

         padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
         child: Stack(
           children: <Widget>[
           PhotoView(
                enableRotation: this.enableRotation,
                backgroundDecoration:  BoxDecoration(color: Colors.white),
                scaleStateChangedCallback: (PhotoViewScaleState p)=>{
                    this.enableRotation == false ? 
                    setState((){
                        this.enableRotation = true;
                    })
                     : null
                  
                  //print(p)
                },
                onTapDown: (BuildContext bc, 
                TapDownDetails details, PhotoViewControllerValue pv)=>{
                  //print("Clicked on: {X:${details.localPosition.dx}};{Y:${details.localPosition.dy}}")
                },
                basePosition: Alignment(93/100, 155/100).add(Alignment.centerLeft),
                minScale: PhotoViewComputedScale.contained * 4,
                maxScale: PhotoViewComputedScale.contained * 15,
                initialScale: PhotoViewComputedScale.contained * 5,
                imageProvider: AssetImage("assets/images/map/floor0.jpg"),
              ),
              Positioned(
                
                  bottom: 10,
                  right: 10,
                  child: RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      this.enableRotation = false;

                    });
                  },
                  elevation: 2.0,
                  fillColor: Theme.of(context).colorScheme.primary,
                  child: FaIcon(
                    FontAwesomeIcons.mapMarkerAlt,
                    color: Colors.white,
                    size: 35.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
              )
           ],
         ),
       ),
     );
  }
}
