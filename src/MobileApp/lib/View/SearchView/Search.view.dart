// @dart=2.9
import 'package:ReachUp/Component/Dialog/CustomDialog.component.dart';
import 'package:ReachUp/Component/TTS/TextToSpeech.component.dart';
import 'package:ReachUp/Controller/Local.controller.dart';
import 'package:ReachUp/Model/Local.dart';
import 'package:ReachUp/View/SearchView/SearchCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _localController = new LocalController();
  String search;
  List<Local> locates;
  List<Local> filterLocates;
  FlutterTts _flutterTts;

  TabController _tabController;
  TextEditingController _controller = TextEditingController();

  buildListView() {
    tabIndex == 2
        ? filterLocates = locates.where((local) => local.type == 0).toList()
        : tabIndex == 3
            ? filterLocates = locates.where((local) => local.type == 1).toList()
            : tabIndex == 4
                ? filterLocates =
                    locates.where((local) => local.type == 2).toList()
                : tabIndex == 5
                    ? filterLocates =
                        locates.where((local) => local.type == 7).toList()
                    : tabIndex == 6
                        ? filterLocates =
                            locates.where((local) => local.type == 3).toList()
                        : tabIndex == 7
                            ? locates
                                .where((local) =>
                                    local.type == 4 ||
                                    local.type == 5 ||
                                    local.type == 8)
                                .toList()
                            : filterLocates = locates;

    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: filterLocates.length,
        itemBuilder: (context, index) {
          return SearchCard(local: filterLocates[index]);
        });
  }

  @override
  void initState() {
    super.initState();
    TextToSpeech.initializeTts();
  }

  @override
  void dispose() {
    super.dispose();
    TextToSpeech.stop();
  }

  bool loading = false;
  int tabIndex = 0;

  List<String> tabBarOptions = [
    "Recentes",
    "Todos",
    "Lojas",
    "Restaurantes",
    "Cinema",
    "Serviços",
    "Banheiro",
    "Público"
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 160,
            actions: [
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primary,
                  child: Form(
                    key: _formKey,
                    child: Row(
                      children: <Widget>[
                        Container(
                            child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 35,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15, 10, 20, 10),
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Campo vazio";
                                }
                                return null;
                              },
                              onChanged: (val) {
                                debugPrint(val);

                                if (val.isNotEmpty) {
                                  setState(() {
                                    loading = true;
                                    search = val;
                                  });

                                  if (val.length > 3)
                                    _localController
                                        .search(val)
                                        .then((value) => {
                                              setState(() {
                                                loading = false;
                                                locates = value;
                                                filterLocates = value;
                                              })
                                            });
                                } else {
                                  setState(() {
                                    locates.clear();
                                  });
                                }
                              },
                              controller: _controller,
                              cursorColor: Colors.white,
                              style: TextStyle(
                                decorationColor: Colors.white,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        locates.clear();
                                      });
                                      _controller.clear();
                                    },
                                    icon: Icon(Icons.clear,
                                        size: 30, color: Colors.white),
                                  ),
                                  hintStyle: TextStyle(
                                    color: Color(0xFFd9d9d9),
                                    fontSize: 21,
                                  ),
                                  labelText: "Pesquise aqui",
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      decorationColor: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20)),
                            ),
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                          icon: Icon(
                            Icons.mic,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            TextToSpeech.speak("Aperte para falar");
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    CustomWidGetDialog(
                                      icon: Icons.mic,
                                      title: "Aperte para falar",
                                      content: Container(),
                                    ));
                          },
                        ),
                        IconButton(
                          padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                          icon: Icon(
                            Icons.more_vert,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            bottom: TabBar(
              onTap: (int index) {
                setState(() {
                  //get tabbar index
                  tabIndex = index;

                  //çç
                });
              },
              indicatorColor: Theme.of(context).colorScheme.onPrimary,
              isScrollable: true,
              labelStyle: TextStyle(
                fontSize: 20,
              ),
              tabs: [
                Tab(
                  text: "Recentes",
                  icon: Icon(
                    FontAwesomeIcons.clock,
                  ),
                ),
                Tab(
                  text: "Todos",
                  icon: Icon(
                    Icons.apps,
                  ),
                ),
                Tab(
                  text: "Lojas",
                  icon: Icon(
                    FontAwesomeIcons.store,
                  ),
                ),
                Tab(
                  text: "Restaurantes",
                  icon: Icon(
                    FontAwesomeIcons.hamburger,
                  ),
                ),
                Tab(
                  text: "Cinema",
                  icon: Icon(
                    FontAwesomeIcons.ticketAlt,
                  ),
                ),
                Tab(
                  text: "Serviços",
                  icon: Icon(
                    FontAwesomeIcons.dollarSign,
                  ),
                ),
                Tab(
                  text: "Banheiro",
                  icon: Icon(
                    FontAwesomeIcons.bath,
                  ),
                ),
                Tab(
                  text: "Público",
                  icon: Icon(
                    FontAwesomeIcons.mapMarked,
                  ),
                )
              ],
            ),
          ),
          body: SafeArea(
            child: Container(
                child: Column(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: loading == true
                      ? Center(
                          child: CircularProgressIndicator(
                              strokeWidth: 6.0,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).colorScheme.primary)),
                        )
                      : filterLocates != null
                          ? buildListView()
                          : Center(
                              child: Text(
                                "Sem resultados",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                              ),
                            ),
                )),
              ],
            )),
          )),
    );
  }
}
