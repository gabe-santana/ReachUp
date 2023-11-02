// @dart=2.9
import 'package:ReachUp/Component/Dialog/CustomDialog.component.dart';
import 'package:ReachUp/Controller/Communique.controller.dart';
import 'package:ReachUp/Model/Communique.model.dart';
import 'package:ReachUp/View/_CommerceViews/HomeCommerce/CommuniqueView/CommuniqueCard.dart';
import 'package:ReachUp/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationsView extends StatefulWidget {
  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  int tabIndex = 0;

  @override
  initState() {
    // _categoryController.getAll().then((value) => () {
    //       categories = value;
    //     });
    super.initState();
    Globals.subCategoriesPromotionChecked.clear();
    Globals.selectedCommuniques.clear();
  }

  Widget _buildListView(int type) {
    List<CommuniqueCard> cards;
    List<Communique> filterList;

    if (type >= 0) {
      filterList = Globals.admLocalCommuniques
          .where((communique) => communique.type == type)
          .toList();

      cards = filterList
          .map((Communique c) =>
              CommuniqueCard(communique: c, onSelected: onCommuniqueSelected))
          .toList();
    } else {
      cards = Globals.admLocalCommuniques
          .map((Communique c) =>
              CommuniqueCard(communique: c, onSelected: onCommuniqueSelected))
          .toList();
    }

    return ListView(
      children: cards,
    );
  }

  onCommuniqueSelected(Communique communique, bool remove) {
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
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => CustomDialog(
                      icon: Icons.delete,
                      title: "Deletar",
                      description:
                          "Deseja deletar o(s) item(s) selecionado(s)?",
                      buttonOK: RaisedButton(
                        color: Theme.of(context).colorScheme.error,
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            EasyLoading.show();

                            CommuniqueController communiqueController =
                                new CommuniqueController();
                            Globals.selectedCommuniques.forEach((comm) {
                              communiqueController.delete(
                                  comm.communiqueId, comm.type);
                            });
                            Globals.admLocalCommuniques.removeWhere((admComm) =>
                                Globals.selectedCommuniques.contains(admComm));

                            Globals.selectedCommuniques.clear();
                            EasyLoading.dismiss();
                          });
                        },
                        child: Text(
                          "Deletar",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      buttonNO: FlatButton(
                        color: Colors.transparent,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancelar",
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                        ),
                      ),
                    ));
          },
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
                  "Anúncios",
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
      ),
    );
  }
}
