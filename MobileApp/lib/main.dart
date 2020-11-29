import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'View/DebugView/Debug.view.dart';
import 'View/_Layouts/HomeLayout.layout.dart';
import 'package:get/get.dart';


void main() {
  runApp(ReachUp());
  configLoading();
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
    onSurface: Colors.black,
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
  primaryColor: Color(0xFF008D9E),
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
    GetStorage storage = new GetStorage();

    return MaterialApp(
      title: 'ReachUp!',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: DebugView(),
      builder: (BuildContext context, Widget child) {
        /// make sure that loading can be displayed in front of all other widgets
        return FlutterEasyLoading(child: child);
      },
    );
  }
}

navigateTo(Widget bodyContent, String titlePage, String info,
    BuildContext context, bool scale) {
 return Navigator.push(
      context,
      !scale
          ? SlideRightRoute(
              page: HomeLayout(
                  titlePage: titlePage, info: info, bodyContent: bodyContent))
          : ScaleRoute(
              page: HomeLayout(
                  titlePage: titlePage, info: info, bodyContent: bodyContent)));
}

navigateDirectly(Widget page, BuildContext context, bool size) {
  return Navigator.push(
      context, size ? ScaleRoute(page: page) : SlideRightRoute(page: page));
}

//Pages Transitions
// class MyCustomRoute<T> extends MaterialPageRoute<T> {
//   MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
//       : super(builder: builder, settings: settings);

//   @override
//   Widget buildTransitions(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation, Widget child) {
//     return new SlideTransition(
//       position: Tween(begin: Offset(1, 0.0), end: Offset(0.0, 0.0))
//           .animate(animation),
//       child: child,
//     );
//   }
// }

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Color(0xFF008D9E)
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Color(0xFF008D9E).withOpacity(0.5)
    ..userInteractions = false;
}
