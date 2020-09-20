import 'package:flutter/material.dart';

class HomeMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Map here!", style: Theme.of(context).textTheme.bodyText1),
          Icon(
            Icons.map,
            size: 40,
          )
        ]);
  }
}
