
import 'package:ReachUp/View/SignView/Sign.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'View/HomeView/Home.view.dart';
import 'View/SignView/Signup.view.dart';


void main() {
  runApp(ReachUp());
}

var darkTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF008D9E),
    onPrimary: Colors.white,
    primaryVariant: Color(0xFF006d7a),
    secondary: Color(0xFF006d7a),
    onSecondary: Colors.white,
    secondaryVariant: Colors.white,
    background: Colors.white,
    onBackground: Color(0xFF212121),
    error: Color(0xFFd42839),
    onError: Colors.white,
    surface: Color(0xFF212121),
    onSurface: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    color: Color(0xFF008D9E),
  ),
  textTheme: TextTheme(
    bodyText1:
        TextStyle(fontSize: 24.0, fontFamily: 'Hind', color: Color(0xFF212121)),
    bodyText2:
        TextStyle(fontSize: 12.0, fontFamily: 'Hind', color: Color(0xFF212121)),
    headline1: TextStyle(
        fontSize: 24.0, fontFamily: 'Hind', fontWeight: FontWeight.bold),
    headline6: TextStyle(
        fontSize: 12.0, fontFamily: 'Hind', fontStyle: FontStyle.italic),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

var lightTheme = ThemeData(
  primaryColor:  Color(0xFF008D9E),
  colorScheme: ColorScheme(
    brightness: Brightness.light,

    primary: Color(0xFF008D9E),
    onPrimary: Colors.white,
    primaryVariant: Color(0xFF006d7a),

    secondary: Color(0xFF006d7a),
    secondaryVariant: Color(0xFF012529),
    onSecondary: Colors.white,

    background: Colors.white,
    onBackground: Color(0xFF525252),

    error: Color(0xFFd42839),
    onError: Colors.white,

    surface: Color(0xFF212121),
    onSurface: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    color: Color(0xFF008D9E),
  ),
  textTheme: TextTheme(
    bodyText1:
        TextStyle(fontSize: 24.0, fontFamily: 'Hind', color: Color(0xFF212121)),
    bodyText2:
        TextStyle(fontSize: 12.0, fontFamily: 'Hind', color: Color(0xFF212121)),
    headline1: TextStyle(
        fontSize: 24.0, fontFamily: 'Hind', fontWeight: FontWeight.bold),
    headline6: TextStyle(
        fontSize: 12.0, fontFamily: 'Hind', fontStyle: FontStyle.italic),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);



class ReachUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReachUp!',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: SignView(),
    );
  }
}

//Pages Transitions
class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return new SlideTransition(
      position: Tween(begin: Offset(1, 0.0), end: Offset(0.0, 0.0))
          .animate(animation),
      child: child,
    );
  }
}

