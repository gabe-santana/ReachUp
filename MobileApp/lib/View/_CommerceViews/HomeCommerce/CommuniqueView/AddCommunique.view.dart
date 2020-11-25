import 'package:ReachUp/Component/Dialog/CustomDialog.component.dart';
import 'package:ReachUp/Controller/Communique.controller.dart';
import 'package:ReachUp/Model/Communique.model.dart';
import 'package:ReachUp/View/_CommerceViews/HomeCommerce/CommuniqueView/AddedCommunique.view.dart';
import 'package:ReachUp/globals.dart';
import 'package:ReachUp/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'AddPromotion.view.dart';

class AddCommuniqueView extends StatefulWidget {
  @override
  _AddCommuniqueViewState createState() => _AddCommuniqueViewState();
}

class DropDownItem {
  bool important;

  String title;
  IconData icon;

  DropDownItem({this.icon, this.title, this.important = false});

  bool operator ==(dynamic other) =>
      other != null &&
      other is DropDownItem &&
      this.title == other.title &&
      this.icon == other.icon;

  @override
  int get hashCode => super.hashCode;
}

class _AddCommuniqueViewState extends State<AddCommuniqueView> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  CommuniqueController communiqueController = new CommuniqueController();
  Communique communique = new Communique();

  List<DropDownItem> dropDownItems = [
    DropDownItem(icon: Icons.category, title: "Selecionar tipo"),
    DropDownItem(
        icon: FontAwesomeIcons.shoppingCart, title: "Promoção direcionada"),
    DropDownItem(icon: Icons.chat, title: "Promoção geral"),
    DropDownItem(icon: Icons.notifications, title: "Notificação"),
    DropDownItem(icon: Icons.report, title: "Alertas"),
  ];

  int selectedItemIndex = 0;

  DateTime pickedDate;
  DateTime pickedEndDate;
  TimeOfDay time;
  TimeOfDay endTime;

  bool finished = false;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    pickedEndDate = DateTime.now();
    time = TimeOfDay.now();
    endTime = TimeOfDay.now();
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        initialDate: hasEndDate ? pickedEndDate : pickedDate,
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
    if (date != null)
      setState(() {
        if (hasEndDate) {
          pickedEndDate = date;
        } else {
          pickedDate = date;
        }
      });
  }

  _pickTime() async {
    TimeOfDay t = await showTimePicker(
        context: context,
        initialTime: time,
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
        time = t;
      });
  }

  bool hasEndDate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: this.finished
            ? AppBar(
                centerTitle: false,
                elevation: selectedItemIndex == 1 ? 0 : 5,
                title: Text(
                  "Adicionado!",
                  style: TextStyle(fontSize: 23),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => CustomDialog(
                                  icon: Icons.info_outline,
                                  title: "Info",
                                  description: "Tela de adicionar comunicados",
                                  buttonOK: RaisedButton(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "OK",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ));
                      },
                      icon: Icon(Icons.info_outline,
                          size: 25, color: Colors.white))
                ],
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.arrow_back, size: 25),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    );
                  },
                ),
              )
            : AppBar(
                centerTitle: false,
                elevation: selectedItemIndex == 1 ? 0 : 5,
                title: Text(
                  "Novo comunicado",
                  style: TextStyle(fontSize: 23),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => CustomDialog(
                                  icon: Icons.info_outline,
                                  title: "Info",
                                  description: "Tela de adicionar comunicados",
                                  buttonOK: RaisedButton(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "OK",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ));
                      },
                      icon: Icon(Icons.info_outline,
                          size: 25, color: Colors.white))
                ],
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.arrow_back, size: 25),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    );
                  },
                ),
                bottom: PreferredSize(
                  child: AnimatedContainer(
                    color: selectedItemIndex == 1
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                    duration: Duration(microseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: DropdownButtonFormField<DropDownItem>(
                        dropdownColor: Theme.of(context).colorScheme.secondary,
                        decoration: InputDecoration.collapsed(hintText: ''),
                        value: dropDownItems[selectedItemIndex]
                          ..important = selectedItemIndex == 1,
                        icon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              size: 25,
                              color: Colors.white, // Add this
                              // Add this
                            )),
                        items: dropDownItems.map((DropDownItem value) {
                          return new DropdownMenuItem<DropDownItem>(
                            value: value,
                            child: Row(
                              children: [
                                //ak
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 30, 0),
                                  child: Icon(
                                    value.icon,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  child: new Text(
                                    value.title,
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (_selectedItem) {
                          setState(() {
                            selectedItemIndex =
                                dropDownItems.indexOf(_selectedItem);
                          });
                        },
                      ),
                    ),
                  ),
                  preferredSize: Size.fromHeight(50),
                ),
              ),
        resizeToAvoidBottomInset: true,
        body: this.finished
            ? AddedCommuniqueView(newCommunique: (bool _new) {
                setState(() {
                  this.finished = !_new;
                  this.hasEndDate = false;
                  this.selectedItemIndex = 0;
                });
              })
            : Container(
                child: SingleChildScrollView(
                  child: Center(
                    child: AnimatedPadding(
                      duration: Duration(microseconds: 500),
                      padding: EdgeInsets.fromLTRB(00, 0, 00, 20),
                      child: Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    AnimatedContainer(
                                      color: selectedItemIndex == 1
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Colors.white,
                                      duration: Duration(milliseconds: 500),
                                      height: selectedItemIndex == 1 ? 60 : 0,
                                      child: ListTile(
                                        onTap: () {
                                          navigateTo(
                                              AddPromotionView(),
                                              "Subcategorias",
                                              "Informe as subcategorias da sua promoção",
                                              context,
                                              true);
                                        },
                                        title: Row(
                                          children: [
                                            selectedItemIndex == 1
                                                ? Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 30, 0),
                                                    child: Icon(
                                                        Icons
                                                            .notification_important,
                                                        color: Colors.white),
                                                  )
                                                : Container(),
                                            selectedItemIndex == 1
                                                ? Text("Adicionar Promoções",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white))
                                                : Container(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: ListTile(
                                    title: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 20, 0),
                                          child: Icon(
                                            Icons.calendar_today,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                          ),
                                        ),
                                        Text(
                                            "Data de início ${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                                            style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                    trailing:
                                        Icon(Icons.edit, color: Colors.grey),
                                    onTap: _pickDate,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: ListTile(
                                    title: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 20, 0),
                                          child: Icon(
                                            FontAwesomeIcons.clock,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                          ),
                                        ),
                                        Text(
                                            "Horário de início ${time.hour}h${time.minute}min"),
                                      ],
                                    ),
                                    trailing:
                                        Icon(Icons.edit, color: Colors.grey),
                                    onTap: _pickTime,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: CheckboxListTile(
                                      activeColor: Colors.green,
                                      title: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "Este anúncio tem prazo",
                                                  overflow: TextOverflow.clip,
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onBackground,
                                                      fontSize: 16),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      value: hasEndDate,
                                      onChanged: (val) {
                                        setState(() {
                                          hasEndDate = val;
                                        });
                                      }),
                                ),
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                height: hasEndDate ? 150 : 0,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ListTile(
                                          title: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 0, 20, 0),
                                                child: Icon(
                                                  Icons.calendar_today,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground,
                                                ),
                                              ),
                                              Text(
                                                  "Data prazo ${pickedEndDate.day}/${pickedEndDate.month}/${pickedEndDate.year}",
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                            ],
                                          ),
                                          trailing: Icon(Icons.edit,
                                              color: Colors.grey),
                                          onTap: _pickDate,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ListTile(
                                          title: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 0, 20, 0),
                                                child: Icon(
                                                  FontAwesomeIcons.clock,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground,
                                                ),
                                              ),
                                              Text(
                                                  "Horário prazo ${endTime.hour}h${endTime.minute}min"),
                                            ],
                                          ),
                                          trailing: Icon(Icons.edit,
                                              color: Colors.grey),
                                          onTap: _pickTime,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                child: TextFormField(
                                  decoration: new InputDecoration(
                                      labelText: "Descrição",
                                      alignLabelWithHint: true,
                                      hintText: "Descreva o comunicado aqui",
                                      hintStyle: TextStyle(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.0),
                                      )),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 8,
                                  maxLength: 1000,
                                  onSaved: (value) {
                                    this.communique.description = value;
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Campo obrigatório!";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: ButtonTheme(
                                  minWidth: MediaQuery.of(context).size.width,
                                  child: RaisedButton(
                                    color: Colors.green,
                                    onPressed: () {
                                      //mandar
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();
                                        this.communique.type =
                                            selectedItemIndex - 1;
                                        this.communique.localId =
                                            Globals.user.admLocal.idLocal;
                                        this.communique.startDate = pickedDate;

                                        if (hasEndDate) {
                                          this.communique.endDate =
                                              pickedEndDate;
                                        }

                                        communiqueController
                                            .add(this.communique)
                                            .then((value) {
                                          if (value) {
                                            setState(() {
                                              Globals.admLocalCommuniques
                                                  .add(communique);
                                              debugPrint("Adicionado");
                                              this.finished = true;
                                            });
                                          } else {
                                            debugPrint("Não Adicionado");
                                          }
                                        });
                                      }
                                    },
                                    child: Text(
                                      "Adicionar",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ));
  }
}
