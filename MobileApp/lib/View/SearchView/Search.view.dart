import 'package:ReachUp/Controller/Local.controller.dart';
import 'package:ReachUp/Model/Local.dart';
import 'package:ReachUp/View/SearchView/SearchCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _localController = new LocalController();
  String search;
  List<Local> locates;
  TabController _tabController;
  TextEditingController _controller = TextEditingController();
  
  buildListView() {
    return ListView.builder(
        itemCount: locates.length,
        itemBuilder: (context, index) {
          return SearchCard(local: locates[index]);
        });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool loading = false;
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 150,
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
                                  });

                                  if (val.length > 3)
                                    _localController
                                        .search(val)
                                        .then((value) => {
                                              setState(() {
                                                locates = value;
                                              })
                                            });

                                  setState(() {
                                    loading = false;
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
                                  hintText: "lojas, locais, produtos ...",
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
                            size: 35,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            print("Mic");
                          },
                        ),
                        IconButton(
                          padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                          icon: Icon(
                            Icons.more_vert,
                            size: 35,
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
                ),
                Tab(text: "Lojas"),
                Tab(text: "Restaurantes"),
                Tab(text: "Livrarias"),
                Tab(text: "Cinema")
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
                            strokeWidth: 7.0,
                          ),
                        )
                      : locates != null
                          ? buildListView()
                          : Center(
                              child:
                                  Lottie.asset("assets/animations/search.json"),
                            ),
                )),
              ],
            )),
          )),
    );
  }
}
