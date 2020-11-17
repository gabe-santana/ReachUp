import 'package:ReachUp/Component/Dialog/CustomDialog.component.dart';
import 'package:ReachUp/Model/Communique.model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'CommuniqueCard.dart';

class CommuniqueView extends StatefulWidget {
  List<Communique> communiques;

  CommuniqueView({this.communiques});
  @override
  _CommuniqueViewState createState() => _CommuniqueViewState();
}

class _CommuniqueViewState extends State<CommuniqueView> {
  int tabIndex = 0;
  List<Communique> selectedCommuniques = new  List<Communique>();

  Widget _buildListView(int type) {
    List<CommuniqueCard> cards;
    List<Communique> filterList;

    if (type >= 0) {
      filterList =
          widget.communiques.where((communique) => communique.type == type).toList();

      cards = filterList.map((e) => CommuniqueCard(e)).toList();
    } else {
      cards = widget.communiques.map((e) => CommuniqueCard(e)).toList();
    }

    return ListView(
      children: cards,
    );
  }

getAppBar() {
    return AppBar(
      title: Text(selectedCommuniques.length < 1
          ? "Multi Selection"
          : "${selectedCommuniques.length} item selected"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: selectedCommuniques.isNotEmpty ? getAppBar() : AppBar(
          title: Text(
            "Comunicados",
            style: TextStyle(fontSize: 25),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                            icon: Icons.info_outline,
                            title: "Info",
                            description:
                                "Aqui você poderá ver todos seus comunicados!",
                            buttonOK: RaisedButton(
                              color: Theme.of(context).colorScheme.primary,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "OK",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ));
                },
                icon: Icon(Icons.more_vert, size: 35, color: Colors.white))
          ],
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back, size: 35),
                onPressed: () {
                  Navigator.pop(context);
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          bottom: TabBar(
            onTap: (int index) {
              setState(() {
                //get tabbar index
                tabIndex = index;
              });
            },
            indicatorColor: Theme.of(context).colorScheme.onPrimary,
            isScrollable: true,
            labelStyle: TextStyle(
              fontSize: 20,
            ),
            tabs: [
              Tab(
                text: "Todos",
                icon: Icon(
                  Icons.apps,
                ),
              ),
              Tab(
                  text: "Promoções direcionadas",
                  icon: Icon(
                    FontAwesomeIcons.shoppingCart,
                  )),
              Tab(
                  text: "Promoções gerais",
                  icon: Icon(
                    Icons.chat,
                  )),
              Tab(
                  text: "Notificações",
                  icon: Icon(
                    Icons.notifications,
                  )),
              Tab(
                text: "Alertas",
                icon: Icon(
                  Icons.report,
                ),
              )
            ],
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: _buildListView(tabIndex-1),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.green),
      ),
    );
  }
}
