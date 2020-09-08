import 'package:flutter/material.dart';

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  children: <Widget>[
                   Positioned(
                     top: 0,
                     right: 0,
                     child:   
                     IconButton(
                           icon:  Icon(Icons.keyboard_arrow_left, color: Colors.white,
                            size: 45, ),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            padding: EdgeInsets.zero,
                         ),
                   ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      child: 
                       Row(
                      children: <Widget>[
                        Icon(Icons.person, color: Colors.white, size: 65,),
                        Container(child:Text('Username', 
                        style: TextStyle(color: Colors.white, 
                        fontSize: 25))),
                      ],
                    ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                  
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.notifications, size: 50,),
                    Text("Notificações", style: TextStyle(fontSize: 25))
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
          
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.headset_mic, size: 50,),
                    Text("Narrador", style: TextStyle(fontSize: 25))
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
          
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.bluetooth_connected, size: 50,),
                    Text("Visitas", style: TextStyle(fontSize: 25))
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),

             ListTile(
                title: Row(
                  children: [
                    Icon(Icons.settings, size: 50,),
                    Text("Configurações", style: TextStyle(fontSize: 25))
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),

               ListTile(
                title: Row(
                  children: [
                    Icon(Icons.info, size: 50,),
                    Text("Info", style: TextStyle(fontSize: 25))
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),

            ],
          ),
        );
  }
}