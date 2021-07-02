import 'package:flutter/material.dart';

class InfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Container(
                width: 300,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                      child: Image.asset(
                          "assets/images/icons/launch/ReachUp.png",
                          width: 150),
                    ),
                    Text(
                        "ReachUp! é um aplicativo móvel para localização indoor, que proporciona uma experiência de interação no shopping para cegos e deficientes visuais, por meio de ferramentas de voz que os usuários podem pesquisar por lojas, banheiros, restaurantes, etc.\n\nAlém disso, o aplicativo oferece ferramentas para que os lojistas divulguem suas promoções ou comunicados e os gerentes dos shoppings recebam relatórios de visitas dos usuários pelo shopping.\n\nMuitas pessoas vão ao shopping por qualquer motivo, pensando nisso, ReachUp ajuda essas pessoas a oferecer muitos recursos de mapeamento interno, úteis não apenas para usuários cegos e deficientes visuais, mas para qualquer pessoa que precise de ajuda para chegar a um lugar mais rápido como cadeira de rodas, deficientes auditivos, idosos, crianças perdidas ou qualquer pessoa que queira apenas mais agilidade no dia a dia.",
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onBackground)),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
