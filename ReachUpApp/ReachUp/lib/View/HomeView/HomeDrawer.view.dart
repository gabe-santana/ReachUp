import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  title: ItemMenuTitle("Mapa", FontAwesomeIcons.mapMarked, true),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                  title:
                      ItemMenuTitle("Notificações", FontAwesomeIcons.solidBell, false),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                  title: ItemMenuTitle("Visitas", FontAwesomeIcons.houseUser, false),
                  onTap: () {
                    // Update the state of the app.
                    // ...
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
                  title: ItemMenuTitle("Narrador", FontAwesomeIcons.headset, false),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                  title: ItemMenuTitle("Configurações", FontAwesomeIcons.tools, false),
                  onTap: () {
                    // Update the state of the app.
                    // ...
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
                  title: ItemMenuTitle("Feedback", FontAwesomeIcons.solidStar, false),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                  title: ItemMenuTitle("Info", FontAwesomeIcons.infoCircle, false),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
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
