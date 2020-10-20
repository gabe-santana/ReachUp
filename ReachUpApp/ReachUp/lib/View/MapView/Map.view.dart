import 'dart:math';

import 'package:ReachUp/Component/Compass/Compass.component.dart';
import 'package:ReachUp/Component/Map/Course.component.dart';
import 'package:ReachUp/Component/Map/Position.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:gesture_x_detector/gesture_x_detector.dart';
import 'package:lottie/lottie.dart';
import 'package:sensors/sensors.dart';

class MapViewWidGet extends StatefulWidget {
  const MapViewWidGet({Key key}) : super(key: key);

  @override
  _MapViewWidGetState createState() => _MapViewWidGetState();
}

class _MapViewWidGetState extends State<MapViewWidGet> {
  bool testMovements = true;

  bool firstLoad = true;
  bool isPlaying = false;
  FlutterTts _flutterTts;

  Position userMarkPosition = new Position(320, 290, 0);
  double userMarkDimension = 35.0;

  double _baseScaleFactor = null;
  double _maxScale = 2.35;
  double _minScale = 1.80;

  double top = 0;
  double left = 0;

  double _scale = 2.0;

  double _dimensionMap = 660;

  @override
  void initState() {
    // accelerometerEvents.listen((AccelerometerEvent event) {
    //   //print(event.x);
    // });
    // // [AccelerometerEvent (x: 0.0, y: 9.8, z: 0.0)]

    // userAccelerometerEvents.listen((UserAccelerometerEvent event) {
    //   print(event.x);
    // });
    // // [UserAccelerometerEvent (x: 0.0, y: 0.0, z: 0.0)]

    // gyroscopeEvents.listen((GyroscopeEvent event) {
    //   //print(event);
    // });

    super.initState();
    initializeTts();

    FlutterCompass.events.listen(_onData);
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

  Future _speakDirection(String direction) async{
    if (direction != null && direction.isNotEmpty) {
      var result;

      switch (direction) {
        case "N":
          result = await _flutterTts.speak("Andando para o Norte");
          break;
           case "E":
          result = await _flutterTts.speak("Andando para o Leste");
          break;
           case "S":
          result = await _flutterTts.speak("Andando para o Sul");
          break;
           case "W":
          result = await _flutterTts.speak("Andando para o Oeste");
          break;
        default:
      }
  
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

  void _handlePanUpdate(
      Offset localPos, Offset position, Offset localDelta, Offset delta) {
    print("pan");
    print(position);
    setState(() {
      top += delta.dy;
      left += delta.dx;
    });
  }

  double focusOn(Position focusPoint, Size mapScreen) {
    setState(() {
      this._scale = 2.0;
      left = -1 *
          ((focusPoint.x * this._scale - mapScreen.width) +
              userMarkDimension / 2);
      top = -1 *
          ((focusPoint.y * this._scale - mapScreen.height) +
              userMarkDimension / 2);
    });

    return 1.0;
  }

  void _handleScaleUpdate(
      Offset changedFocusPoint, double scale, double rotation) {
    setState(() {
      if (this._scale <= _maxScale && this._scale >= _minScale) {
        this._scale = _baseScaleFactor * scale;

        print("scale");
        print(changedFocusPoint);

        this._scale >= _maxScale ? this._scale = _maxScale : null;

        this._scale <= _minScale ? this._scale = _minScale : null;
      }
      print(this._scale);
    });
  }

  double _heading = 0;

  String get _readout => _heading.toStringAsFixed(0) + '°';
 
  void _onData(double x) {
    if (this.mounted)
      setState(() {
        _heading = x;
        //  print(_heading);

      });
  }

  final TextStyle _style = TextStyle(
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.w200,
  );

  @override
  Widget build(BuildContext context) {
    if (firstLoad) {
      _speak("Seja bem-vindo!");
      firstLoad = false;
      focusOn(userMarkPosition, MediaQuery.of(context).size / 2);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return XGestureDetector(
          onMoveUpdate: _handlePanUpdate,
          onScaleStart: (details) {
            _baseScaleFactor = _scale;
          },
          onScaleUpdate: _handleScaleUpdate,
          child: Stack(
            children: <Widget>[
              
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                top: top,
                left: left,
                width: _dimensionMap * _scale,
                child: Stack(children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.secondaryVariant,
                        BlendMode.hue),
                    child: Image.asset(
                      "assets/images/map/floor0.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
       
                  AnimatedPositioned(
                    left: userMarkPosition.x * _scale,
                    top: userMarkPosition.y * _scale,
                    duration: Duration(seconds: 1),
                   
                    child: Transform.rotate(
                        angle: 2 * pi * (_heading / 360),
                        child:
                            // Lottie.asset(
                            //     'assets/animations/user-location.json',
                            //     fit: BoxFit.contain)

                            //     )
                            Container(
                        
                              height: userMarkDimension  * _scale,
                              width: userMarkDimension   *_scale,
                              decoration: BoxDecoration(
                                  
                                  color: Colors.orange.withAlpha(50),
                                  borderRadius: BorderRadius.circular(100)
                              ),
                            
                              child: Icon(Icons.keyboard_arrow_up, size: userMarkDimension *_scale,
                              color: Colors.orange)
                            )),
                  )
                ]),
              ),
        
              testMovements
                  ? Positioned(
                      bottom: 100,
                      right: 10,
                      child: RawMaterialButton(
                        onPressed: () {
                          setState((){

                 
                          Course c = new  Course();
                           c = new Course().getCourseDirection(_heading); 
                          print(c.cardialDirection);
                          if (!isPlaying) {
                         
                            _speakDirection(c.cardialDirection);
                          }
                          setState(() {
                            switch (c.cardialDirection) {
                              case "N":
                                 this.userMarkPosition.y -= 10;
                                break;
                                  case "E":
                                 this.userMarkPosition.x += 10;
                                break;
                                  case "S":
                                 this.userMarkPosition.y += 10;
                                break;
                                  case "W":
                                 this.userMarkPosition.x -= 10;
                                break;

                            }
  
                          });
                          focusOn(
                              userMarkPosition,
                              new Size(constraints.maxWidth / 2,
                                  constraints.maxHeight / 2));
                          });
                        },
                        elevation: 2.0,
                        fillColor: Theme.of(context).colorScheme.primary,
                        child: FaIcon(
                          FontAwesomeIcons.arrowUp,
                          color: Colors.white,
                          size: 35.0,
                        ),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                      ),
                    )
                   :  Container(),
                   Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: RawMaterialButton(
                                    onPressed: () {
                                      focusOn(
                                          userMarkPosition,
                                          new Size(constraints.maxWidth / 2,
                                              constraints.maxHeight / 2));
                                    },
                                    elevation: 2.0,
                                    fillColor:
                                        Theme.of(context).colorScheme.primary,
                                    child: FaIcon(
                                      FontAwesomeIcons.mapMarkerAlt,
                                      color: Colors.white,
                                      size: 35.0,
                                    ),
                                    padding: EdgeInsets.all(15.0),
                                    shape: CircleBorder(),
                                  ),
                                ),
            ],
          ),
        );
      },
    );
  }
}

class MapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MapViewWidGet(),
    );
  }
}
