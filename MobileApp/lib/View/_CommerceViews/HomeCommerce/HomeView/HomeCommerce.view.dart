import 'package:ReachUp/Component/Dialog/CustomDialog.component.dart';
import 'package:ReachUp/Controller/Account.controller.dart';
import 'package:ReachUp/Controller/Communique.controller.dart';
import 'package:ReachUp/Controller/Local.controller.dart';
import 'package:ReachUp/Model/Communique.model.dart';
import 'package:ReachUp/Model/Local.dart';
import 'package:ReachUp/Repositories/Local.repository.dart';
import 'package:ReachUp/View/SignView/SignIn.view.dart';
import 'package:ReachUp/View/_CommerceViews/HomeCommerce/StoreView/Store.view.dart';
import 'package:ReachUp/View/_Layouts/HomeLayout.layout.dart';
import 'package:async/async.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:intl/intl.dart';

import '../../../../globals.dart';
import '../../../../main.dart';
import '../CommuniqueView/Communique.view.dart';

class DashBoardData {
  static List<Communique> communiques;
  static Local local;
}

class HomeCommerceView extends StatefulWidget {
  @override
  _HomeCommerceViewState createState() => _HomeCommerceViewState();
}

class CommuniqueTypeAnalitic {
  int specifOff;
  int generalOff;
  int notifications;
  int alerts;

  CommuniqueTypeAnalitic(
      {this.specifOff, this.generalOff, this.notifications, this.alerts});

  static List<String> communiqueListFilter = <String>[
    'Comunicados ativos',
    'Todos os Comunicados',

  
  ];
  static String communiqueFilter = communiqueListFilter[0];
  static bool general = true;
}

class _HomeCommerceViewState extends State<HomeCommerceView> {
  updateData() {
    this.communiqueTypeAnalitic = new CommuniqueTypeAnalitic(
      specifOff: DashBoardData.communiques
          .where((communique) =>
              communique.type == 0 &&
              (CommuniqueTypeAnalitic.general
                  ? isCurrentDateInRange(
                      communique.startDate, communique.endDate)
                  : true))
          .toList()
          .length,
      generalOff: DashBoardData.communiques
          .where((communique) =>
              communique.type == 1 &&
              (CommuniqueTypeAnalitic.general
                  ? isCurrentDateInRange(
                      communique.startDate, communique.endDate)
                  : true))
          .toList()
          .length,
      notifications: DashBoardData.communiques
          .where((communique) =>
              communique.type == 2 &&
              (CommuniqueTypeAnalitic.general
                  ? isCurrentDateInRange(
                      communique.startDate, communique.endDate)
                  : true))
          .toList()
          .length,
      alerts: DashBoardData.communiques
          .where((communique) =>
              communique.type == 3 &&
              (CommuniqueTypeAnalitic.general
                  ? isCurrentDateInRange(
                      communique.startDate, communique.endDate)
                  : true))
          .toList()
          .length,
    );
    this.data = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(
              this.communiqueTypeAnalitic.alerts.toDouble(), Colors.red[300],
              rankKey: 'Q1'),
          new CircularSegmentEntry(
              this.communiqueTypeAnalitic.specifOff.toDouble(),
              Colors.orange[300],
              rankKey: 'Q2'),
          new CircularSegmentEntry(
              this.communiqueTypeAnalitic.generalOff.toDouble(),
              Colors.purple[300],
              rankKey: 'Q3'),
          new CircularSegmentEntry(
              this.communiqueTypeAnalitic.notifications.toDouble(),
              Colors.yellow[300],
              rankKey: 'Q4'),
        ],
        rankKey: 'Quarterly Profits',
      ),
    ];
  }

  AsyncMemoizer _memoizer;
  @override
  initState() {
    // _categoryController.getAll().then((value) => () {
    //       categories = value;
    //     });
    super.initState();
    _memoizer = AsyncMemoizer();
  }

  bool isCurrentDateInRange(DateTime startDate, DateTime endDate) {
    final currentDate = DateTime.now();
    print(
        "Hoje é $currentDate\nComunicado começou em $startDate e terminou em $endDate");

    startDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate.toString());
    endDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(endDate.toString());
    return currentDate.isAfter(startDate) && currentDate.isBefore(endDate);
  }

  AccountController accountController = new AccountController();
  CommuniqueController communiqueController = new CommuniqueController();

  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  List<CircularStackEntry> data;

  CommuniqueTypeAnalitic communiqueTypeAnalitic;

  Future _fetchData() async {
    return this._memoizer.runOnce(() async {
      await accountController.getShopkeeperLocal().then((value) async {
        DashBoardData.local = value;

        await communiqueController
            .getByLocal(DashBoardData.local.idLocal, true)
            .then((value) {
          DashBoardData.communiques = value;

          updateData();
        });
      });

      return DashBoardData;
    });
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
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          httpHeaders: {
                            "Authorization": "Bearer ${Globals.user.token}"
                          },
                          imageUrl:
                              LocalRepository().getImage(DashBoardData.local),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Colors.grey)),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
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
                                child: Text(DashBoardData.local.name,
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
                                  DashBoardData.local.floor == 0
                                      ? "Térreo"
                                      : "${DashBoardData.local.floor}º Andar",
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
                                  "Abre às: ${DashBoardData.local.openingHour}",
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
                                  "Fecha às: ${DashBoardData.local.closingHour}",
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
                        child: DropdownButton<String>(
                          value: CommuniqueTypeAnalitic.communiqueFilter,
                          items: CommuniqueTypeAnalitic.communiqueListFilter
                              .map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value,
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground)),
                            );
                          }).toList(),
                          onChanged: (selectedItem) {
                            setState(() {
                              int index = CommuniqueTypeAnalitic
                                  .communiqueListFilter
                                  .indexOf(selectedItem);

                              index == 0
                                  ? CommuniqueTypeAnalitic.general = true
                                  : CommuniqueTypeAnalitic.general = false;
                              CommuniqueTypeAnalitic.communiqueFilter =
                                  selectedItem;

                              updateData();
                              _chartKey.currentState.updateData(data);
                            });
                          },
                        ),
                      )),
                  Container(
                    child: AnimatedCircularChart(
                      duration: Duration(seconds: 1),
                      key: _chartKey,
                      size: const Size(300.0, 300.0),
                      initialChartData: data,
                      chartType: CircularChartType.Pie,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Icon(FontAwesomeIcons.shoppingCart,
                              color: Colors.orange[300]),
                        ),
                        Text(
                            communiqueTypeAnalitic.specifOff > 0
                                ? communiqueTypeAnalitic.specifOff == 1
                                    ? "1 Promoção direcionada"
                                    : "${communiqueTypeAnalitic.specifOff} Promoções direcionadas"
                                : "Nenhuma promoção direcionada",
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
                            color: Colors.purple[300],
                          ),
                        ),
                        Text(
                            communiqueTypeAnalitic.generalOff > 0
                                ? communiqueTypeAnalitic.generalOff == 1
                                    ? "1 Promoção geral"
                                    : "${this.communiqueTypeAnalitic.generalOff} Promoções gerais"
                                : "Nenhuma promoção geral",
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
                          child: Icon(Icons.notifications,
                              color: Colors.yellow[300]),
                        ),
                        Text(
                            this.communiqueTypeAnalitic.notifications > 0
                                ? this.communiqueTypeAnalitic.notifications == 1
                                    ? "1 Notificação"
                                    : "${this.communiqueTypeAnalitic.notifications} Notificações"
                                : "Nenhuma notificação",
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
                          child: Icon(Icons.report, color: Colors.red[300]),
                        ),
                        Text(
                            this.communiqueTypeAnalitic.notifications > 0
                                ? this.communiqueTypeAnalitic.notifications == 1
                                    ? "1 Alerta"
                                    : "${this.communiqueTypeAnalitic.alerts} Alertas"
                                : "Nenhum alerta",
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
      ],
    );
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
                          onTap: () {
                              Navigator.pop(context);
                            navigateTo(
                                StoreView(),
                                "Minha loja",
                                "Aqui você pode editar os dados de sua loja!",
                                context, false);
                          },
                        ),
                        ListTile(
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                            title: ItemMenuTitle(
                              title: "Comunicados",
                              icon: Icons.chat,
                            ),
                            onTap: () {
                                Navigator.pop(context);
                              navigateDirectly(
                                  CommuniqueView(
                                      communiques: DashBoardData.communiques),
                                  context, false);
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
                                    Navigator.pop(context);
                                  navigateTo(HomeCommerceView(), "Info",
                                      "Quem somos nós?", context, false);
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

                                          this.dispose();
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
              style: TextStyle(fontSize: 23),
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu, size: 25),
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
                  icon: Icon(Icons.more_vert, size: 25, color: Colors.white),
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
