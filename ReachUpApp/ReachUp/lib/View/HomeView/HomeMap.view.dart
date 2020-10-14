import 'package:ReachUp/Component/Compass/Compass.component.dart';
import 'package:ReachUp/Component/Map/Map.component.dart';
import 'package:ReachUp/Component/TTS/TextToSpeech.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_tts/flutter_tts.dart'; 
import 'package:sensors/sensors.dart';


     
class HomeMap extends StatefulWidget {

  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  
 bool enableRotation = true;

  bool isPlaying = false;
  FlutterTts _flutterTts;

  @override
  void initState() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      //print(event.x);
    });
    // [AccelerometerEvent (x: 0.0, y: 9.8, z: 0.0)]

    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
     print(event.x);
    });
    // [UserAccelerometerEvent (x: 0.0, y: 0.0, z: 0.0)]

    gyroscopeEvents.listen((GyroscopeEvent event) {
      //print(event);
    });

    super.initState();
    initializeTts();
  }

   initializeTts() {
    _flutterTts = FlutterTts();
    setTtsLanguage();
    _flutterTts.setStartHandler(() {
      setState(() {
        isPlaying = true;
      });
    });
    

    _flutterTts.setCompletionHandler(() {
      setState(() {
        isPlaying = false;
      });
    });

    _flutterTts.setErrorHandler((err) {
      setState(() {
        print("error occurred: " + err);
        isPlaying = false;
      });
    });
  }


  Future _speak(String text) async {
    if (text != null && text.isNotEmpty) {
      var result = await _flutterTts.speak(text);
      if (result == 1)
        setState(() {
          isPlaying = true;
        });
    }
  }

  Future _stop() async {
    var result = await _flutterTts.stop();
    if (result == 1)
      setState(() {
        isPlaying = false;
      });
  }

  void setTtsLanguage() async {
    await _flutterTts.setLanguage("pt-BR");
  }

  @override
  void dispose() {
    super.dispose();
    _flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    //final map = MapObject();
    
     return Container(
       color: Theme.of(context).colorScheme.primaryVariant,
       child: Padding(

         padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
         child: Stack(
           children: <Widget>[
          // change it for matrix gestures
       
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
             basePosition: Alignment(120/100, 120/100).add(Alignment.topLeft),
             minScale: PhotoViewComputedScale.contained * 4,
             maxScale: PhotoViewComputedScale.contained * 15,
             initialScale: PhotoViewComputedScale.contained * 5,
             imageProvider: AssetImage("assets/images/map/floor0.jpg"),
           ),
              Positioned(
       
                width: 50,
                height: 50,
                left: (MediaQuery.of(context).size.width/2),
                top: (MediaQuery.of(context).size.height/2) - 200,
                child: FaIcon(
                    FontAwesomeIcons.mapMarkerAlt,
                    color: Colors.orange,
                    size:75.0,
                  ),
              ),
                 
              Positioned(
                
                  bottom: 10,
                  right: 10,
                  child: RawMaterialButton(
                  onPressed: () {
                       if(isPlaying)
                        {
                          _stop();
                        }else
                          {
                            _speak("Vire a direita");
                          }

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
