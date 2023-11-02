// @dart=2.9
import 'package:ReachUp/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddAlternativeHoursView extends StatefulWidget {
  @override
  _AddAlternativeHoursViewState createState() =>
      _AddAlternativeHoursViewState();
}

class _AddAlternativeHoursViewState extends State<AddAlternativeHoursView> {
  List<String> days = [
    "Domingo",
    "Segunda-feira",
    "Terça-feira",
    "Quarta-feira",
    "Quinta-feira",
    "Sábado"
  ];

  int dayIndex = 0;

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

  void showSnackBarMessage(ctx, String message,
      [MaterialColor color = Colors.green]) {
    Scaffold.of(ctx).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    ));
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

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Center(
        child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                      value: days[dayIndex],
                      items: days.map((String value) {
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
                          dayIndex = days.indexOf(selectedItem);
                        });
                      }),
                  ListTile(
                    title: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Icon(
                            FontAwesomeIcons.clock,
                            color: Theme.of(context).colorScheme.onBackground,
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
                            color: Theme.of(context).colorScheme.onBackground,
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
                ])),
      ),
    ));
  }
}
