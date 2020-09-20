import 'package:flutter/material.dart';

import 'View/HomeView/Home.view.dart';

void main() {
  runApp(MyApp());
}

var darkTheme = ThemeData(
         colorScheme: ColorScheme(
           primary: Color(0xFF193445),
            onPrimary: null, 
           secondary: Colors.white, 
           background: null, 
           brightness: Brightness.dark, 
           error: null, 
           onBackground: null, 
           onError: null, 
           onSecondary: null,
           onSurface: null, 
           primaryVariant: null, 
           surface: null, 
           secondaryVariant: null,
         ),
         
         appBarTheme: AppBarTheme(
         centerTitle: true,
         color: Color(0xFF193445),

        ),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontFamily: 'Hind', fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 6.0, fontFamily: 'Hind', fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 24.0, fontFamily: 'Hind', color: Colors.white),
        ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        );

var lightTheme = ThemeData(
         primaryColor: Color(0xFF1B8C9C),
         appBarTheme: AppBarTheme(
         centerTitle: true,
         color: Color(0xFF1B8C9C),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontFamily: 'Hind', fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 6.0, fontFamily: 'Hind', fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 24.0, fontFamily: 'Hind', color: Colors.black),
        ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        );

var littleDarkTheme = ThemeData(
        appBarTheme: AppBarTheme(
        centerTitle: true,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontFamily: 'Hind', fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 6.0, fontFamily: 'Hind', fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 24.0, fontFamily: 'Hind', color: Colors.white), 
      ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReachUp!',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: Home(),
    );
  }
}

//Pages Transitions 
class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {


    return new SlideTransition(
          position: Tween( 
                  begin: Offset(1, 0.0),
                  end: Offset(0.0, 0.0))
              .animate(animation),
          child: child,
      );
  }
}