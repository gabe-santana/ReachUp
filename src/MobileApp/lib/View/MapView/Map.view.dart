// @dart=2.9
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:ReachUp/Component/Map/Course.component.dart';
import 'package:ReachUp/Component/Map/Halls.component.dart';
import 'package:ReachUp/Component/Map/MapObject.component.dart';
import 'package:ReachUp/Component/TTS/TextToSpeech.component.dart';
import 'package:ReachUp/View/MapView/RouteSign.view.dart';
import 'package:ReachUp/globals.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gesture_x_detector/gesture_x_detector.dart';
import 'package:lottie/lottie.dart';
import 'dart:async' show Future, StreamController, StreamSubscription, Timer;
import 'package:flutter/services.dart' show PlatformException, rootBundle;

class MapViewWidGet extends StatefulWidget {
  bool inRouting;

  MapViewWidGet({Key key, @required this.inRouting}) : super(key: key);

  @override
  _MapViewWidGetState createState() => _MapViewWidGetState();
}

class _MapViewWidGetState extends State<MapViewWidGet> {
  MapObject mapObject;
  HallController hallController;

  bool displayMap = false;
  bool testMovements = false;
  bool canUpdateRoute = true;
  bool firstLoad = true;
  bool isPlaying = false;

  Position userMarkPosition = new Position(x: 40 * 12, y: 17 * 11, floor: 0);
  double userMarkDimension = 35.0;

  double _baseScaleFactor = null;
  double _maxScale = 2.35;
  double _minScale = 1.80;

  double top = 0;
  double left = 0;

  double _scale = 2.5;

  double _dimensionMap = 660;
  Timer timer;
  Future<String> loadMapJson() async {
    return await rootBundle.loadString('assets/map/map.json');
  }

  @override
  void initState() {
    super.initState();

    TextToSpeech.initializeTts();

    FlutterCompass.events.listen(_onData);
    loadMapJson().then((mapJson) {
      setState(() {
        Position pointerUMP = new Position(
            x: userMarkPosition.x ~/ 12,
            y: userMarkPosition.y ~/ 11,
            floor: userMarkPosition.floor);
        // pointerUMP.x = pointerUMP.x ~/ 12;
        // pointerUMP.y = pointerUMP.y ~/ 11;
        mapObject = new MapObject.fromJson(jsonDecode(mapJson));
        displayMap = true;
        hallController = new HallController(floor: mapObject.floors[0]);
        currentRoute = hallController.distanceBetween(
            hallController.getHallFromMap(pointerUMP),
            hallController
                .getHallFromMap(new Position(x: 33, y: 23, floor: 0)));
        print("carregado");
      });
    });

    timer = widget.inRouting
        ? Timer.periodic(Duration(seconds: 4), (Timer t) => updateRoute())
        : null;
  }

  updateRoute() {}

  Future _speakDirection(String direction) async {
    if (direction != null && direction.isNotEmpty) {
      var result;

      switch (direction) {
        case "N":
          result = await TextToSpeech.speak("Andando para o Norte");
          break;
        case "E":
          result = await TextToSpeech.speak("Andando para o Leste");
          break;
        case "S":
          result = await TextToSpeech.speak("Andando para o Sul");
          break;
        case "W":
          result = await TextToSpeech.speak("Andando para o Oeste");
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
    var result = await TextToSpeech.stop();
    if (result == 1)
      setState(() {
        isPlaying = false;
      });
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

  bool hasCompass = true;
  double setAngleCompass() {
    try {
      return 2 * pi * (_heading / 360);
    } catch (e) {
      hasCompass = false;
      return 0;
    }
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
      });
  }

  final TextStyle _style = TextStyle(
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.w200,
  );

  List<Halls> currentRoute;

  @override
  Widget build(BuildContext context) {
    if (firstLoad) {
      setAngleCompass();
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
                  // MatrixRoute(
                  //     new List<Halls>()
                  //       ..add(new Halls(
                  //           cornerInfo: new CornerInfo(),
                  //           position: new Position(x: 39, y: 17, floor: 0)))
                  //             ..add(new Halls(
                  //           cornerInfo: new CornerInfo(),
                  //           position: new Position(x: 38, y: 17, floor: 0)))
                  //             ..add(new Halls(
                  //           cornerInfo: new CornerInfo(),
                  //           position: new Position(x: 37, y: 17, floor: 0)))
                  //             ..add(new Halls(
                  //           cornerInfo: new CornerInfo(),
                  //           position: new Position(x: 36, y: 17, floor: 0)))
                  //             ..add(new Halls(
                  //           cornerInfo: new CornerInfo(),
                  //           position: new Position(x: 35, y: 17, floor: 0))),
                  //     _scale,
                  //     _dimensionMap),
                  // ,

                  displayMap
                      ? widget.inRouting // ? widget.inRouting
                          ? canUpdateRoute
                              ? MatrixRoute(
                                  this.currentRoute, _scale, _dimensionMap)
                              : Container()
                          : Container()
                      : Container(),
                  AnimatedPositioned(
                      left: userMarkPosition.x * _scale,
                      top: userMarkPosition.y * _scale,
                      duration: Duration(seconds: 1),
                      child: Transform.rotate(
                          angle: hasCompass ? 2 * pi * (_heading / 360) : 0,
                          child: hasCompass
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Course c = new Course();
                                      c = new Course()
                                          .getCourseDirection(_heading);
                                      print(c.cardialDirection);
                                      // if (!isPlaying) {
                                      //   _speakDirection(c.cardialDirection);
                                      // }
                                      setState(() {
                                        switch (c.cardialDirection) {
                                          case "N":
                                            this.userMarkPosition.y -= 1;
                                            break;
                                          case "E":
                                            this.userMarkPosition.x += 1;
                                            break;
                                          case "S":
                                            this.userMarkPosition.y += 1;
                                            break;
                                          case "W":
                                            this.userMarkPosition.x -= 1;
                                            break;
                                        }
                                      });
                                      focusOn(
                                          userMarkPosition,
                                          new Size(constraints.maxWidth / 2,
                                              constraints.maxHeight / 2));
                                    });
                                  },
                                  child: Container(
                                      height: userMarkDimension * _scale,
                                      width: userMarkDimension * _scale,
                                      decoration: BoxDecoration(
                                          color: Colors.orange.withAlpha(50),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Icon(Icons.keyboard_arrow_up,
                                          size: userMarkDimension * _scale,
                                          color: Colors.orange)),
                                )
                              : Container(
                                  height: userMarkDimension * _scale,
                                  width: userMarkDimension * _scale,
                                  child: FaIcon(FontAwesomeIcons.mapMarkerAlt,
                                      size: userMarkDimension * _scale,
                                      color: Colors.orange)))),
                ]),
              ),
              testMovements
                  ? Positioned(
                      bottom: 100,
                      right: 10,
                      child: RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            Course c = new Course();
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
                  : Container(),
              Positioned(
                bottom: 10,
                right: 10,
                child: RawMaterialButton(
                  onPressed: () {
                    TextToSpeech.speak("Focando na sua posição");
                    focusOn(
                        userMarkPosition,
                        new Size(constraints.maxWidth / 2,
                            constraints.maxHeight / 2));
                  },
                  elevation: 2.0,
                  fillColor: Colors.orange,
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

class MapView extends StatefulWidget {
  bool inRouting;
  MapView({this.inRouting = false});

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> with WidgetsBindingObserver {
  final StreamController<BluetoothState> streamController = StreamController();
  StreamSubscription<BluetoothState> _streamBluetooth;
  StreamSubscription<RangingResult> _streamRanging;
  final _regionBeacons = <Region, List<Beacon>>{};

  bool authorizationStatusOk = false;
  bool locationServiceEnabled = false;
  bool bluetoothEnabled = false;
  AsyncMemoizer _memoizer;

  listeningState() async {
    print('Listening to bluetooth state');
    _streamBluetooth = flutterBeacon
        .bluetoothStateChanged()
        .listen((BluetoothState state) async {
      print('BluetoothState = $state');
      streamController.add(state);

      switch (state) {
        case BluetoothState.stateOn:
          initScanBeacon();
          break;
        case BluetoothState.stateOff:
          await pauseScanBeacon();
          await checkAllRequirements();
          break;
      }
    });
  }

  checkAllRequirements() async {
    final bluetoothState = await flutterBeacon.bluetoothState;
    final bluetoothEnabled = bluetoothState == BluetoothState.stateOn;
    final authorizationStatus = await flutterBeacon.authorizationStatus;
    final authorizationStatusOk =
        authorizationStatus == AuthorizationStatus.allowed ||
            authorizationStatus == AuthorizationStatus.always;
    final locationServiceEnabled =
        await flutterBeacon.checkLocationServicesIfEnabled;

    setState(() {
      this.authorizationStatusOk = authorizationStatusOk;
      this.locationServiceEnabled = locationServiceEnabled;
      this.bluetoothEnabled = bluetoothEnabled;
    });
  }

  initScanBeacon() async {
    await flutterBeacon.initializeScanning;
    await checkAllRequirements();
    if (!authorizationStatusOk ||
        !locationServiceEnabled ||
        !bluetoothEnabled) {
      print('RETURNED, authorizationStatusOk=$authorizationStatusOk, '
          'locationServiceEnabled=$locationServiceEnabled, '
          'bluetoothEnabled=$bluetoothEnabled');
      return;
    }
    final regions = <Region>[];

    regions.add(Region(identifier: 'com.beacon'));

    if (_streamRanging != null) {
      if (_streamRanging.isPaused) {
        _streamRanging.resume();
        return;
      }
    }

    _streamRanging =
        flutterBeacon.ranging(regions).listen((RangingResult result) {
      if (result != null && mounted) {
        setState(() {
          _regionBeacons[result.region] = result.beacons;
          Globals.beacons.clear();
          _regionBeacons.values.forEach((list) {
            Globals.beacons.addAll(list);
          });
          Globals.beacons.sort(_compareParameters);
        });
      }
    });
  }

  pauseScanBeacon() async {
    _streamRanging?.pause();
    if (Globals.beacons.isNotEmpty) {
      setState(() {
        Globals.beacons.clear();
      });
    }
  }

  int _compareParameters(Beacon a, Beacon b) {
    int compare = a.proximityUUID.compareTo(b.proximityUUID);

    if (compare == 0) {
      compare = a.major.compareTo(b.major);
    }

    if (compare == 0) {
      compare = a.minor.compareTo(b.minor);
    }

    return compare;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print('AppLifecycleState = $state');
    if (state == AppLifecycleState.resumed) {
      if (_streamBluetooth != null && _streamBluetooth.isPaused) {
        _streamBluetooth.resume();
      }
      await checkAllRequirements();
      if (authorizationStatusOk && locationServiceEnabled && bluetoothEnabled) {
        await initScanBeacon();
      } else {
        await pauseScanBeacon();
        await checkAllRequirements();
      }
    } else if (state == AppLifecycleState.paused) {
      _streamBluetooth?.pause();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    streamController?.close();
    _streamRanging?.cancel();
    _streamBluetooth?.cancel();
    flutterBeacon.close;

    _memoizer = null;
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _memoizer = AsyncMemoizer();
    WidgetsBinding.instance.addObserver(this);
    listeningState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<BluetoothState>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final state = snapshot.data;

              if (state == BluetoothState.stateOn) {
                return MapViewWidGet(inRouting: widget.inRouting);
              }

              if (state == BluetoothState.stateOff) {
                if (Platform.isAndroid) {
                  try {
                    _memoizer.runOnce(() {
                      flutterBeacon.openBluetoothSettings;
                    });
                  } on PlatformException catch (e) {
                    print(e);
                  }
                } else if (Platform.isIOS) {}
              }

              if (!authorizationStatusOk) {
                _memoizer.runOnce(() {
                  flutterBeacon.requestAuthorization;
                });
              }

              if (!locationServiceEnabled) {
                if (Platform.isAndroid) {
                  _memoizer.runOnce(() {
                    flutterBeacon.openLocationSettings;
                  });
                } else if (Platform.isIOS) {}
              }
            }
            return Container();
          },
          stream: streamController.stream,
          initialData: BluetoothState.stateUnknown),
    );
  }
}
