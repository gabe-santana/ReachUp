// @dart=2.9
import 'package:ReachUp/Component/Map/MapObject.component.dart';
import 'package:flutter/material.dart';

class RouteParameters {
  double _scale;
  Position position;

  RouteParameters(this._scale, this.position);
}

class MatrixRoute extends StatelessWidget {
  List<Halls> route;
  double _scale;
  double _dimensionMap;
  MatrixRoute(this.route, this._scale, this._dimensionMap);
  @override
  Widget build(BuildContext context) {
    List<Widget> routeView = new List<Widget>()
      ..add(Container(
        height: _dimensionMap * _scale,
        width: _dimensionMap * _scale,
      ));
    route.forEach((r) {
      routeView.add(new RouteSign(new RouteParameters(_scale, r.position)));
    });
    return Stack(children: routeView);
  }
}

class RouteSign extends StatefulWidget {
  RouteParameters routeParameters;

  RouteSign(this.routeParameters);

  @override
  _RouteSignState createState() => _RouteSignState();
}

class _RouteSignState extends State<RouteSign> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: 50 * widget.routeParameters._scale,
      width: 50 * widget.routeParameters._scale,
      top: (widget.routeParameters.position.y * 11).toDouble() *
              widget.routeParameters._scale +
          50,
      left: (widget.routeParameters.position.x * 12).toDouble() *
              widget.routeParameters._scale +
          10,
      child: Align(
        alignment: Alignment.topLeft,
        child: AnimatedContainer(
            height: 10 * widget.routeParameters._scale,
            width: 10 * widget.routeParameters._scale,
            duration: Duration(seconds: 1),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.error.withAlpha(50),
                borderRadius: BorderRadius.circular(100))),
      ),
    );
  }
}
