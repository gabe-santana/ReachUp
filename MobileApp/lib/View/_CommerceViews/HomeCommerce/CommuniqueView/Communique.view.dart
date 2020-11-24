import 'package:ReachUp/Component/Dialog/CustomDialog.component.dart';
import 'package:ReachUp/Model/Communique.model.dart';
import 'package:ReachUp/View/_CommerceViews/HomeCommerce/CommuniqueView/AddCommunique.view.dart';
import 'package:ReachUp/globals.dart';
import 'package:ReachUp/main.dart';
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

  @override
  initState() {
    // _categoryController.getAll().then((value) => () {
    //       categories = value;
    //     });
    super.initState();
    Globals.selectedCommuniques.clear();
  }

  Widget _buildListView(int type) {
    List<CommuniqueCard> cards;
    List<Communique> filterList;

    if (type >= 0) {
      filterList = widget.communiques
          .where((communique) => communique.type == type)
          .toList();

      cards = filterList
          .map((Communique c) =>
              CommuniqueCard(communique: c, onSelected: onCommuniqueSelected))
          .toList();
    } else {
      cards = widget.communiques
          .map((Communique c) =>
              CommuniqueCard(communique: c, onSelected: onCommuniqueSelected))
          .toList();
    }

    return ListView(
      children: cards,
    );
  }

  onCommuniqueSelected(Communique communique, bool remove) {
    print("comunicado ${communique.description} selecionado!");

    setState(() {
      if (remove) {
        Globals.selectedCommuniques
            .removeWhere((element) => element == communique);
      } else {
        Globals.selectedCommuniques.add(communique);
      }
    });
  }

  getAppBar() {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.arrow_back, size: 35),
            onPressed: () {
              setState(() {
                Globals.selectedCommuniques.clear();
              });
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      title: Text(Globals.selectedCommuniques.length < 1
          ? "Multi Selection"
          : "${Globals.selectedCommuniques.length} itens selecionados"),
      actions: [
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {},
        )
      ],
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
          fontSize: 18,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: Globals.selectedCommuniques.isNotEmpty
            ? getAppBar()
            : AppBar(
                centerTitle: false,
                title: Text(
                  "Comunicados",
                  style: TextStyle(fontSize: 23),
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.filter_list,
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                      onPressed: () {},
                      icon:
                          Icon(Icons.more_vert, size: 25, color: Colors.white))
                ],
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.arrow_back, size: 25),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
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
                    fontSize: 18,
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
                )),
        resizeToAvoidBottomInset: true,
        body: _buildListView(tabIndex - 1),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
              navigateDirectly(AddCommuniqueView(), context, false);
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.green),
      ),
    );
  }
}
