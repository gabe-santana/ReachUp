import 'package:flutter/material.dart';
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
          onTap: (){
            
          },
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
                    text: "Minha rota",
                  ),
                  Tab(text: "Sugestões"),
                    Tab(text: "Locais próximos"),
                ],
              ),
            ),
            tabIndex == 0
                ? widget.inRouting
                    ? Center(child: Text("walking route info"))
                    : Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: FaIcon(
                                  FontAwesomeIcons.route,
                                  color: Colors.grey,
                                  size: 40,
                                ),
                              ),
                              Text("Você não está em rota neste momento",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                        ),
                      )
                : Expanded(
                    child: Center(
                        child: ListView(
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
          ],
        ),
      ),
    );
  }
}
