// @dart=2.9
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:ReachUp/View/DebugView/Debug.view.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  Widget newScreen;
  Splash(this.newScreen);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashState();
  }
}

class SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.secondaryVariant,
                    BlendMode.color),
                image: AssetImage("assets/images/bkg/bkg_initial_screen.jpg"),
                fit: BoxFit.cover)),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SpriteDemo(),
                  Image.asset("assets/images/icons/launch/ReachUp.png",
                      width: 150),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() async {
    Timer(Duration(seconds: 3), nextScreen);
  }

  void nextScreen() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget.newScreen),
      (Route<dynamic> route) => false,
    );
  }
}

class SpritePainter extends CustomPainter {
  final Animation<double> _animation;

  SpritePainter(this._animation) : super(repaint: _animation);

  void circle(Canvas canvas, Rect rect, double value) {
    double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    Color color = new Color.fromRGBO(0, 141, 158, opacity);

    double size = rect.width / 2;
    double area = size * size;
    double radius = sqrt(area * value / 4);

    final Paint paint = new Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = new Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(SpritePainter oldDelegate) {
    return true;
  }
}

class SpriteDemo extends StatefulWidget {
  @override
  SpriteDemoState createState() => new SpriteDemoState();
}

class SpriteDemoState extends State<SpriteDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
    );
    //_startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.stop();
    _controller.reset();
    _controller.repeat(
      period: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
      painter: new SpritePainter(_controller),
      child: new SizedBox(
        width: 300.0,
        height: 300.0,
      ),
    );
  }
}
