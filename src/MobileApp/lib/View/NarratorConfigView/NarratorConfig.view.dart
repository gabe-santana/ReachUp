// @dart=2.9
import 'package:ReachUp/Component/Database/Database.db.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

class NarratorConfig extends StatefulWidget {
  int toggleIndex = 0;
  NarratorConfig() {
    Database.select(key: "narrator").response == "true"
        ? toggleIndex = 0
        : toggleIndex = 1;

    print(Database.select(key: "narrator").response);
  }
  @override
  _NarratorConfigState createState() => _NarratorConfigState();
}

class _NarratorConfigState extends State<NarratorConfig> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  List<String> speedOptions = ["Lenta", "Média", "Rápida"];
  int speedOptionsIndex = 0;

  List<String> genderOptions = ["Masculino", "Feminino"];
  int genderOptionsIndex = 0;

  List<String> intervalOptions = ["Curto", "Médio", "Rápido", "Insistente"];
  int intervalOptionsIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: ToggleSwitch(
                    minWidth: MediaQuery.of(context).size.width * 0.4,
                    cornerRadius: 20.0,
                    activeBgColor: [ widget.toggleIndex == 0
                        ? Colors.green
                        : Theme.of(context).colorScheme.error ],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    labels: ['Ativado', 'Desativado'],
                    initialLabelIndex: widget.toggleIndex,
                    icons: [FontAwesomeIcons.check, FontAwesomeIcons.times],
                    onToggle: (index) {
                      setState(() {
                        widget.toggleIndex = index;
                        widget.toggleIndex == 0
                            ? Database.update(key: "narrator", value: "true")
                            : Database.update(key: "narrator", value: "false");
                      });
                    },
                  ),
                ),
                widget.toggleIndex != 0
                    ? Center(
                        child: Text(
                          "Narrador desativado!",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontSize: 18),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                    child: Text(
                                      "Velocidade",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Spacer(),
                                  DropdownButton<String>(
                                      value: speedOptions[speedOptionsIndex],
                                      items: speedOptions.map((String value) {
                                        return new DropdownMenuItem<String>(
                                          value: value,
                                          child: new Text(value,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground)),
                                        );
                                      }).toList(),
                                      onChanged: (selectedItem) {
                                        setState(() {
                                          speedOptionsIndex = speedOptions
                                              .indexOf(selectedItem);
                                        });
                                      }),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 50, 0),
                                    child: Text(
                                      "Gênero",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Spacer(),
                                  DropdownButton<String>(
                                      value: genderOptions[genderOptionsIndex],
                                      items: genderOptions.map((String value) {
                                        return new DropdownMenuItem<String>(
                                          value: value,
                                          child: new Text(value,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground)),
                                        );
                                      }).toList(),
                                      onChanged: (selectedItem) {
                                        setState(() {
                                          genderOptionsIndex = genderOptions
                                              .indexOf(selectedItem);
                                        });
                                      }),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                    child: Text(
                                      "Intervalo",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Spacer(),
                                  DropdownButton<String>(
                                      value:
                                          intervalOptions[intervalOptionsIndex],
                                      items:
                                          intervalOptions.map((String value) {
                                        return new DropdownMenuItem<String>(
                                          value: value,
                                          child: new Text(value,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground)),
                                        );
                                      }).toList(),
                                      onChanged: (selectedItem) {
                                        setState(() {
                                          intervalOptionsIndex = intervalOptions
                                              .indexOf(selectedItem);
                                        });
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
