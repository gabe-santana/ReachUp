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
      length: 2,
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
                  Tab(text: "Sugestões"),
                  Tab(text: "Favoritos"),
                ],
              ),
            ),
            tabIndex == 0
                ? Expanded(
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
                : Expanded(
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
          ],
        ),
      ),
    );
  }
}
