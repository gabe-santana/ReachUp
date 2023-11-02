// @dart=2.9
import 'package:ReachUp/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WalkingInfoView extends StatefulWidget {
  bool inRouting;

  WalkingInfoView({this.inRouting = false});
  @override
  _WalkingInfoViewState createState() => _WalkingInfoViewState();
}

class SuggestionItem extends StatelessWidget {
  String title;
  Widget icon;

  SuggestionItem({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: ListTile(
          title: Row(
            children: [
              this.icon,
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Text(this.title),
              ),
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }
}

class _WalkingInfoViewState extends State<WalkingInfoView> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).colorScheme.primary,
              child: TabBar(
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
                    text: "Sugestões",
                    icon: Icon(Icons.live_tv),
                  ),
                  Tab(text: "Favoritos", icon: Icon(FontAwesomeIcons.heart)),
                  Tab(
                      text: "Beacons próximos",
                      icon: Icon(FontAwesomeIcons.bluetooth)),
                ],
              ),
            ),
            tabIndex == 0
                ? Expanded(
                    child: Center(
                        child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        SuggestionItem(
                          title: "Caminhar até a saída",
                          icon: FaIcon(FontAwesomeIcons.signOutAlt),
                        ),
                        SuggestionItem(
                          title: "Voltar a última visita",
                          icon: FaIcon(FontAwesomeIcons.mapMarkedAlt),
                        ),
                        SuggestionItem(
                          title: "Banheiro mais próximo",
                          icon: FaIcon(FontAwesomeIcons.bath),
                        ),
                        SuggestionItem(
                          title: "Escada mais próxima",
                          icon: FaIcon(FontAwesomeIcons.etsy),
                        ),
                        SuggestionItem(
                          title: "Restaurante mais próximo",
                          icon: FaIcon(FontAwesomeIcons.hamburger),
                        ),
                      ],
                    )),
                  )
                : tabIndex == 1
                    ? Expanded(
                        child: Center(
                          child: Text(
                            "Você não tem\n locais favoritos no momento!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: Globals.beacons == null ||
                                Globals.beacons.isEmpty
                            ? Center(
                                child: CircularProgressIndicator(
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            Theme.of(context)
                                                .colorScheme
                                                .primary)))
                            : Stack(
                                children: [
                                  ListView(
                                    physics: BouncingScrollPhysics(),
                                    children: ListTile.divideTiles(
                                        context: context,
                                        tiles: Globals.beacons.map((beacon) {
                                          return ListTile(
                                            title: Text(beacon.proximityUUID),
                                            subtitle: new Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 10, 0),
                                                  child: Container(
                                                    child: FaIcon(
                                                      FontAwesomeIcons
                                                          .bluetooth,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                    child: Text(
                                                        'Major: ${beacon.major}\nMinor: ${beacon.minor}',
                                                        style: TextStyle(
                                                            fontSize: 13.0)),
                                                    flex: 1,
                                                    fit: FlexFit.tight),
                                                Flexible(
                                                    child: Text(
                                                        'Distância: ${beacon.accuracy}m\nRSSI: ${beacon.rssi}',
                                                        style: TextStyle(
                                                            fontSize: 13.0)),
                                                    flex: 2,
                                                    fit: FlexFit.tight)
                                              ],
                                            ),
                                          );
                                        })).toList(),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 10,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.orange,
                                      radius: 25,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: Icon(Icons.refresh),
                                        color: Colors.white,
                                        onPressed: () {
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ))
          ],
        ),
      ),
    );
  }
}
