import 'package:ReachUp/View/HomeView/HomeMap.view.dart';
import 'package:ReachUp/View/SearchView/Search.view.dart';
import 'package:flutter/material.dart';
import 'package:ReachUp/View/HomeView/HomeDrawer.view.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: HomeDrawer(),
        endDrawer: Search(),
        appBar: AppBar(
            title: const Text(
              "ReachUp!",
              style: TextStyle(fontSize: 30),
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu, size: 35),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            actions: <Widget>[
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.search, size: 35, color: Colors.white),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              )
            ]),
  
        body: Container(
          
          child: Column(children: <Widget>[
            Expanded(child: Container(child: Center(child: HomeMap()))),
            Container(
                width: double.infinity,
                height: 45,
                child: InkWell(
                    child: Container(
                      color: Theme.of(context).colorScheme.primary,
                      child: Center(
                        child: Icon(Icons.arrow_upward,
                            color: Colors.white, size: 35),
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                                child: Column(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 45,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    child: Center(
                                      child: Icon(Icons.arrow_downward,
                                          color: Colors.white, size: 35),
                                    ),
                                  ),
                                ),
                                Text('Walking Info',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontSize: 24.0)),
                              ],
                            ));
                          });
                    }))
          ]),
        ));
  }
}
