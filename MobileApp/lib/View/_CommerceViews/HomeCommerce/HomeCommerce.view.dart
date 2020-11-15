import 'package:ReachUp/Component/Dialog/CustomDialog.component.dart';
import 'package:ReachUp/Model/Communique.model.dart';
import 'package:ReachUp/Model/Local.dart';
import 'package:ReachUp/View/SignView/SignIn.view.dart';
import 'package:ReachUp/View/_Layouts/HomeLayout.layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../globals.dart';

class DashBoardData {
  List<Communique> communiques;

  DashBoardData({this.communiques});
}

class HomeCommerceView extends StatefulWidget {
  @override
  _HomeCommerceViewState createState() => _HomeCommerceViewState();
}

class _HomeCommerceViewState extends State<HomeCommerceView> {
  Future _fetchData() {
    return Future<bool>.value(true);
  }

  Widget bodyBuilder() {
    return Container(
        child: FutureBuilder(
            future: _fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                EasyLoading.dismiss();
                return Center(child: buildListView());
              } else {
                return Builder(
                  builder: (context) {
                    EasyLoading.show(status: "Buscando itens...");
                    return Container();
                  },
                );
              }
            }));
  }

  buildListView() {
    return ListView(
      children: [
        Card(
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.image,
                          size: 80,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Container(
                                child: Text("Nome local",
                                    style: TextStyle(
                                      fontSize: 19,
                                    ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: FaIcon(
                                    FontAwesomeIcons.mapMarkedAlt,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                Text(
                                  "Andar: 0",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: FaIcon(FontAwesomeIcons.clock,
                                      color: Colors.green),
                                ),
                                Text(
                                  "Abre às: 0",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.green),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: FaIcon(
                                    FontAwesomeIcons.clock,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  "Fecha às: 0",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.red),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Container(
                        child: Text("Comunicados",
                            style: TextStyle(
                              fontSize: 19,
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Icon(FontAwesomeIcons.shoppingCart,
                              color: Colors.orange),
                        ),
                        Text("0 Promoções direcionadas",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                fontSize: 16))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Icon(
                            Icons.chat,
                            color: Colors.purple,
                          ),
                        ),
                        Text("0 Promoções gerais",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                fontSize: 16))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child:
                              Icon(Icons.notifications, color: Colors.yellow),
                        ),
                        Text("0 Notificações",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                fontSize: 16))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Icon(Icons.report, color: Colors.red),
                        ),
                        Text("0 Alertas",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                fontSize: 16))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
            child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Container(
                      child: Text("Comunicados",
                          style: TextStyle(
                            fontSize: 19,
                          ))),
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }

  _navigateTo(Widget bodyContent, String title, String info) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeLayout(
                titlePage: title, info: info, bodyContent: bodyContent)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: Column(
          children: [
            Container(
              height: 130,
              child: DrawerHeader(
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: FaIcon(
                              FontAwesomeIcons.userAlt,
                              color: Colors.white,
                              size: 45,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  child: Text(Globals.user.name,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                          fontSize: 25))),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: Opacity(
                                    opacity: 0.5,
                                    child: Text(Globals.user.email,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary,
                                            fontSize: 16)),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
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
            ),
            Expanded(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          selected: true,
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                          title: ItemMenuTitle(
                              title: "Dashboard", icon: Icons.insert_chart),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          selected: true,
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                          title: ItemMenuTitle(
                            title: "Minha Loja",
                            icon: Icons.store,
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                            title: ItemMenuTitle(
                              title: "Comunicados",
                              icon: Icons.chat,
                            ),
                            onTap: () {
                              _navigateTo(HomeCommerceView(), "Notificações",
                                  "Suas notificações estarão sempre aqui");
                            }),
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
                                  top: BorderSide(
                                      width: 1.0, color: Color(0xFFededed)),
                                )),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(15, 10, 0, 15),
                                  child: const Text(
                                    "Contato",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  ),
                                ),
                              ),
                              ListTile(
                                contentPadding:
                                    EdgeInsets.fromLTRB(15, 0, 0, 10),
                                title: ItemMenuTitle(
                                  title: "Info",
                                  icon: FontAwesomeIcons.infoCircle,
                                ),
                                onTap: () {
                                  _navigateTo(HomeCommerceView(), "Info",
                                      "Quem somos nós?");
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border(
                            top: BorderSide(
                                width: 1.0, color: Color(0xFFededed)),
                          )),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15, 10, 0, 15),
                            child: const Text(
                              "Sair",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ),
                        ),
                        ListTile(
                          selected: true,
                          focusColor: Colors.black,
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                          title: ItemMenuTitle(
                            danger: true,
                            title: "Sair",
                            icon: FontAwesomeIcons.signOutAlt,
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => CustomDialog(
                                    title: "Sair",
                                    description: "Deseja sair?",
                                    buttonOK: RaisedButton(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        child: Text("Continuar",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }),
                                    buttonNO: FlatButton(
                                        onPressed: () {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignInView()),
                                            (Route<dynamic> route) => false,
                                          );
                                        },
                                        child: Text(
                                          "Sair",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 19),
                                        )),
                                    icon: FontAwesomeIcons.signOutAlt));
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )),
        endDrawer: Container(),
        appBar: AppBar(
            title: const Text(
              "ReachUp!",
              style: TextStyle(fontSize: 25),
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
                  icon: Icon(Icons.more_vert, size: 35, color: Colors.white),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              )
            ]),
        body: bodyBuilder());
  }
}

class ItemMenuTitle extends StatelessWidget {
  String title;
  IconData icon;
  bool danger;
  ItemMenuTitle({this.title, this.icon, this.danger = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(icon,
            size: 30,
            color: danger
                ? Theme.of(context).colorScheme.error
                : Theme.of(context).colorScheme.onBackground),
        Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: danger
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context).colorScheme.onBackground),
            ))
      ],
    );
  }
}
