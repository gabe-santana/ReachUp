import 'package:ReachUp/Component/Map/Position.component.dart';
import 'package:flutter/material.dart';
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


  bool firstLoad = true;
  bool isPlaying = false;
  FlutterTts _flutterTts;

  Position userMarkPosition;
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

    setState(() {
      userMarkPosition = new Position(450, 170, 0);
    });


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

  void _handlePanUpdate(
      Offset localPos, Offset position, Offset localDelta, Offset delta) {
    print("pan");
    print(position);
    setState(() {
      top += delta.dy;
      left += delta.dx;
    });
  }

  void focusOn(Position focusPoint, Size mapScreen) {
    setState(() {
      this._scale = 2.0;
      left = -1 *
          ((focusPoint.x * this._scale - mapScreen.width) +
              userMarkDimension / 2);
      top = -1 *
          ((focusPoint.y * this._scale - mapScreen.height) +
              userMarkDimension / 2);
    });
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

  @override
  Widget build(BuildContext context) {
    if(firstLoad){
      // fluttieAnimationController.start();
      firstLoad = false;
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
                duration: Duration(milliseconds: 100),
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
                  Positioned(
                    left: userMarkPosition.x * _scale,
                    top: userMarkPosition.y * _scale,
                    // child: FaIcon(
                    //   FontAwesomeIcons.mapMarkerAlt,
                    //   color: Colors.orange,
                    //   size: userMarkDimension * _scale,
                    // ),

                    child: Container(
                   
                      width: 100,
                      height: 100,
                      child: Lottie.asset('assets/animations/pin.json', fit: BoxFit.cover)),
                  ),
                ]),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: RawMaterialButton(
                  onPressed: () {
                    if (isPlaying) {
                      _stop();
                    } else {
                      _speak("Vire a direita");
                    }
                    setState(() {
                      this.userMarkPosition.x += 10;
                    });
                    focusOn(
                        userMarkPosition,
                        new Size(constraints.maxWidth / 2,
                            constraints.maxHeight / 2));
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
    return Center(
      child: MapViewWidGet(),
    );
  }
}
