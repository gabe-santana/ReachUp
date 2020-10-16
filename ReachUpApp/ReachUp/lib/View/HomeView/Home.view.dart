import 'package:ReachUp/View/DeveloperView/BeaconBroadcast.view.dart';
import 'package:ReachUp/View/DeveloperView/Compass.view.dart';
import 'package:ReachUp/View/HomeView/HomeMap.view.dart';
import 'package:ReachUp/View/SearchView/Search.view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FragmentWidget extends StatelessWidget {

  Widget contentWidget;
  FragmentWidget(this.contentWidget);

  @override
  Widget build(BuildContext context) => contentWidget;
}

class Home extends StatefulWidget {

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

 Widget _getDrawerItem(int pos) {
    switch (pos) {
      case 0:
        return FragmentWidget(HomeMap());
      case 7:
        return FragmentWidget(BroadcastBeacon());
      case 8:
        return FragmentWidget(Compass());
    }
  }
  _onSelectItem(int index) {
   
    Navigator.of(context).pop();
     setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 45,
                          ),
                          onPressed: () {
                            
                          },
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FaIcon(
                              FontAwesomeIcons.userCircle,
                              color: Colors.white,
                              size: 85,
                            ),
                            Container(
                                child: Text('Username',
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).colorScheme.onSecondary,
                                        fontSize: 25))),
                            Container(
                                child: Opacity(
                              opacity: 0.5,
                              child: Text('Username@email.com',
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.onSecondary,
                                      fontSize: 16)),
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.primaryVariant
                      ])),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ListTile(   
                        selected: true,
                        contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                        title: ItemMenuTitle("Mapa", FontAwesomeIcons.mapMarked, _selectedIndex == 0),
                        onTap: () {
                           _onSelectItem(0);
                        },
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                        title:
                            ItemMenuTitle("Notificações", FontAwesomeIcons.solidBell, _selectedIndex == 1),
                        onTap: () {
                          _onSelectItem(1);
                        },
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                        title: ItemMenuTitle("Visitas", FontAwesomeIcons.houseUser, _selectedIndex == 2),
                        onTap: () {
                           _onSelectItem(2);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                          top: BorderSide(width: 1.0, color: Color(0xFFededed)),
                        )),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15, 10, 0, 15),
                          child: const Text(
                            "Configurações",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                        title: ItemMenuTitle("Narrador", FontAwesomeIcons.headset, _selectedIndex == 3),
                        onTap: () {
                          _onSelectItem(3);
                        },
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                        title: ItemMenuTitle("Configurações", FontAwesomeIcons.tools, _selectedIndex == 4),
                        onTap: () {
                           _onSelectItem(4);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                          top: BorderSide(width: 1.0, color: Color(0xFFededed)),
                        )),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15, 10, 0, 15),
                          child: const Text(
                            "Contato",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                        title: ItemMenuTitle("Feedback", FontAwesomeIcons.solidStar, _selectedIndex == 5),
                        onTap: () {
                           _onSelectItem(5);
                        },
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                        title: ItemMenuTitle("Info", FontAwesomeIcons.infoCircle, _selectedIndex == 6),
                        onTap: () {
                          _onSelectItem(6);
                        },
                      ),
                    ],
                  ),
                ),
                  Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                          top: BorderSide(width: 1.0, color: Color(0xFFededed)),
                        )),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15, 10, 0, 15),
                          child: const Text(
                            "Desenvolvedor",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                        title: ItemMenuTitle("Beacons broadcast", FontAwesomeIcons.broadcastTower, _selectedIndex == 7),
                        onTap: () {
                           _onSelectItem(7);
                        },
                      ),
                        ListTile(
                          selected: true,
                          focusColor: Colors.black,
                        contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                        title: ItemMenuTitle("Compass viewer", FontAwesomeIcons.compass, _selectedIndex == 8),
                        onTap: () {
                           _onSelectItem(8);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
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
            Expanded(child: 
            Container(
              child: 
            Center(child: _getDrawerItem(this._selectedIndex)))),
            //Melhorar if ternário
            this._selectedIndex == 0 ? Container(
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
          : Container()]),
        ));
  }
}

class ItemMenuTitle extends StatelessWidget {
  String title;
  IconData icon;
  bool selected;

  ItemMenuTitle(this.title, this.icon, this.selected) {}
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(icon,
            size: 30, color: selected == true ? Theme.of(context).colorScheme.primaryVariant : Theme.of(context).colorScheme.onBackground),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text(title,
              style: TextStyle(
                  fontSize: 20,
              color: selected == true ? Theme.of(context).colorScheme.primaryVariant : Theme.of(context).colorScheme.onBackground),
        )
        )],
    );
  }
}