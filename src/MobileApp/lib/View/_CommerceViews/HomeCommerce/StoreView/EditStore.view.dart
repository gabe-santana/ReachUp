// @dart=2.9
import 'package:ReachUp/globals.dart';
import 'package:ReachUp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'AddAlternativeHours.view.dart';

class EditSoreView extends StatefulWidget {
  @override
  _EditSoreViewState createState() => _EditSoreViewState();
}

class _EditSoreViewState extends State<EditSoreView> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TimeOfDay openingTime;
  TimeOfDay closingTime;

  TimeOfDay fromString(String time) {
    int hh = 0;
    if (time.endsWith('PM')) hh = 12;
    time = time.split(' ')[0];
    return TimeOfDay(
      hour: hh +
          int.parse(time.split(":")[0]) %
              24, // in case of a bad time format entered manually by the user
      minute: int.parse(time.split(":")[1]) % 60,
    );
  }

  @override
  void deactivate() {
    EasyLoading.dismiss();
    super.deactivate();
  }

  @override
  void initState() {
    openingTime = fromString(Globals.user.admLocal.openingHour);
    closingTime = fromString(Globals.user.admLocal.closingHour);
    super.initState();
  }

  _pickOpeningTime() async {
    TimeOfDay t = await showTimePicker(
        context: context,
        initialTime: openingTime,
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                // change the border color
                primary: Theme.of(context).colorScheme.primary,
                // change the text color
                onSurface: Theme.of(context).colorScheme.primary,
              ),
              // button colors
              buttonTheme: ButtonThemeData(
                colorScheme: ColorScheme.light(
                  primary: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            child: child,
          );
        });
    if (t != null)
      setState(() {
        openingTime = t;
      });
  }

  _pickClosingTime() async {
    TimeOfDay t = await showTimePicker(
        context: context,
        initialTime: closingTime,
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                // change the border color
                primary: Theme.of(context).colorScheme.primary,
                // change the text color
                onSurface: Theme.of(context).colorScheme.primary,
              ),
              // button colors
              buttonTheme: ButtonThemeData(
                colorScheme: ColorScheme.light(
                  primary: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            child: child,
          );
        });
    if (t != null)
      setState(() {
        closingTime = t;
      });
  }

  void showSnackBarMessage(ctx, String message,
      [MaterialColor color = Colors.green]) {
    Scaffold.of(ctx).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: TextFormField(
                    initialValue: Globals.user.admLocal.name,
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    onSaved: (value) {
                      Globals.user.password = value;
                    },
                    maxLines: 1,
                    //initialValue: 'Aseem Wangoo',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite um nome válido!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Nome da loja',
                        //filled: true,
                        icon: const FaIcon(FontAwesomeIcons.store),
                        labelStyle: TextStyle(
                            decorationStyle: TextDecorationStyle.solid)),
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      "Horários",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          fontSize: 16),
                                    ),
                                    Positioned(
                                      right: 1,
                                      child: IconButton(
                                          padding: EdgeInsets.all(0),
                                          icon: Icon(
                                            Icons.add_circle,
                                            color: Colors.green,
                                          ),
                                          onPressed: () {
                                            navigateTo(
                                                AddAlternativeHoursView(),
                                                "Horários extras",
                                                "Aqui você poderá editar os horários extras na qual sua loja persiste em funcionamento",
                                                context,
                                                true);
                                          }),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Icon(
                                FontAwesomeIcons.clock,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                            Text(
                                "Abertura ${openingTime.hour}h${openingTime.minute}min"),
                          ],
                        ),
                        trailing: Icon(Icons.edit, color: Colors.grey),
                        onTap: _pickOpeningTime,
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Icon(
                                FontAwesomeIcons.clock,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                            Text(
                                "Fechamento ${closingTime.hour}h${closingTime.minute}min"),
                          ],
                        ),
                        trailing: Icon(Icons.edit, color: Colors.grey),
                        onTap: _pickClosingTime,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Center(
                          child: Column(
                            children: [
                              ButtonTheme(
                                minWidth: 200,
                                child: RaisedButton(
                                  color: Colors.green,
                                  onPressed: () {
                                    showSnackBarMessage(
                                        context, "Alterações Salvas");
                                  },
                                  child: Text(
                                    "Salvar alterações",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              ButtonTheme(
                                minWidth: 200,
                                child: RaisedButton(
                                  color: Theme.of(context).colorScheme.error,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Desfazer alterações",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
