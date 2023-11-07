// @dart=2.9
import 'dart:convert';

import 'package:ReachUp/Component/Database/Database.db.dart';
import 'package:ReachUp/Component/Dialog/CustomDialog.component.dart';
import 'package:ReachUp/Controller/Account.controller.dart';
import 'package:ReachUp/Controller/Category.controller.dart';
import 'package:ReachUp/Model/Category.model.dart';
import 'package:ReachUp/Model/User.model.dart';
import 'package:ReachUp/View/SignView/SignUpPreferences.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../globals.dart';

List<GlobalKey<FormState>> formKeys = [
  GlobalKey<FormState>(), //Username formState
  GlobalKey<FormState>(), //Useremail formState
  GlobalKey<FormState>(), //Userpassword formState
];

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  int currentStep;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
        appBar: AppBar(
          title: Text("Criar uma nova conta"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                            icon: Icons.info_outline,
                            title: "Info",
                            description:
                                "O cadastro é necessário para usar o ReachUp.\n\n" +
                                    "Através dele podemos identificá-lo, autenticá-lo\n" +
                                    "e lhe proporcionar uma melhor experiência!",
                            buttonOK: RaisedButton(
                              color: Theme.of(context).colorScheme.primary,
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
                icon: Icon(Icons.info_outline, color: Colors.white))
          ],
        ),
        resizeToAvoidBottomInset: true,
        body: Align(
          alignment: Alignment.center,
          child: Column(children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
            SignInButtonBuilder(
              icon: FontAwesomeIcons.google,
              width: MediaQuery.of(context).size.width * 0.7,
              text: "Cadastre-se com Google",
              onPressed: () {},
              backgroundColor: Color(0xFFCB1F27),
            ),
            SignInButtonBuilder(
              icon: FontAwesomeIcons.facebookF,
              width: MediaQuery.of(context).size.width * 0.7,
              text: "Cadastre-se com Facebook",
              onPressed: () {},
              backgroundColor: Color(0xFF3B5998),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
            Expanded(child: StepperBody()),
          ]),
        ));
  }
}

class UserData {
  String name;
  String email;
  String password;
}

class StepperBody extends StatefulWidget {
  @override
  _StepperBodyState createState() => _StepperBodyState();
}

class _StepperBodyState extends State<StepperBody> {
  final CategoryController _categoryController = new CategoryController();
  final AccountController accountController = new AccountController();

  static final _focusNode = FocusNode();
  static UserData user = UserData();

  int currStep = 0;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
      print('Has focus: $_focusNode.hasFocus');
    });
  }

  @override
  void deactivate() {
    EasyLoading.dismiss();
    super.deactivate();
  }

  List<Step> steps = [
    Step(
        title: Text('Nome', style: TextStyle(color: Color(0xFF525252))),
        subtitle: const Text(
          'Como devemos chamá-lo(a)?',
          style: TextStyle(fontSize: 16),
        ),
        isActive: true,
        //state: StepState.error,
        state: StepState.indexed,
        content: Form(
          key: formKeys[0],
          child: Column(
            children: <Widget>[
              TextFormField(
                focusNode: _focusNode,
                keyboardType: TextInputType.text,
                autocorrect: false,
                onSaved: (value) {
                  user.name = value;
                  print(user.name);
                },
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 4) {
                    return 'Nome inválido!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Nome',

                    //filled: true,
                    icon: const Icon(Icons.person),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                onSaved: (value) {
                  user.name = "${user.name.trim()} $value";
                  print(user.name);
                },
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 4) {
                    return 'Sobrenome inválido!';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Sobrenome',

                    //filled: true,
                    icon: const Icon(Icons.person),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
            ],
          ),
        )),
    Step(
        title: Text('E-mail', style: TextStyle(color: Color(0xFF525252))),
        subtitle: const Text(
          'Meio de contato',
          style: TextStyle(fontSize: 16),
        ),
        isActive: true,
        state: StepState.indexed,
        // state: StepState.disabled,
        content: Form(
          key: formKeys[1],
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (value) {
                  if (value.isEmpty || !value.contains('@')) {
                    return 'E-mail inválido!';
                  }
                },
                onSaved: (value) {
                  user.email = value;
                },
                maxLines: 1,
                decoration: InputDecoration(
                    labelText: 'E-mail',
                    icon: const Icon(Icons.email),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
            ],
          ),
        )),
    Step(
        title: Text('Senha', style: TextStyle(color: Color(0xFF525252))),
        subtitle: const Text(
          'Sua senha',
          style: TextStyle(fontSize: 16),
        ),
        isActive: true,
        state: StepState.indexed,
        content: Form(
          key: formKeys[2],
          child: Column(
            children: <Widget>[
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                autocorrect: false,
                validator: (value) {
                  if (value.isEmpty || value.length < 6) {
                    return 'Senha inválida! (minimo 6 caracteres)';
                  }
                },
                maxLines: 1,
                onSaved: (value) {
                  user.password = value;
                },
                decoration: InputDecoration(
                    labelText: 'Senha',
                    icon: const FaIcon(FontAwesomeIcons.key),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                autocorrect: false,
                validator: (value) {
                  if (value.isEmpty || value.length < 6) {
                    return 'Senha inválida! (minimo 6 caracteres)';
                  }
                },
                maxLines: 1,
                onSaved: (value) {},
                decoration: InputDecoration(
                    labelText: 'Confirmar Senha',
                    icon: const FaIcon(FontAwesomeIcons.key),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
            ],
          ),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ));
    }

    void _submitForm() {
      final FormState formState = _formKey.currentState;
      bool validated = true;

      if (!formState.validate()) {
        showSnackBarMessage(
          'Preencha todos os campos corretamente!',
        );
      } else {
        formState.save();

        formKeys.forEach((key) {
          if (!key.currentState.validate()) {
            showSnackBarMessage('Preencha todos os campos corretamente!');
            validated = false;
          } else {
            key.currentState.save();
          }
        });

        if (validated) {
          print("Name: ${user.name}");
          print("Phone: ${user.email}");
          print("Email: ${user.password}");

          Globals.user = new User(
              name: user.name,
              email: user.email,
              password: user.password,
              role: "cli");
          EasyLoading.show(status: "Carregando");
          accountController.signUp().then((value) {
            EasyLoading.dismiss();
            Globals.user = value;
            Database.insert(
                key: "user", value: jsonEncode(Globals.user.toJson()));
          });

          List<Category> categories = new List<Category>();

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpPreferencesView()),
          );
        }
        ;
      }
    }

    return Container(
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formKey,
          child: ListView(children: <Widget>[
            Stepper(
              controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    children: <Widget>[
                      currStep != 2
                          ? FlatButton(
                              onPressed: onStepContinue,
                              color: Theme.of(context).colorScheme.primary,
                              child: Text("Próximo",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)))
                          : Container(),
                      currStep != 0 && currStep != 2
                          ? FlatButton(
                              onPressed: onStepCancel,
                              child: const Text(
                                'Voltar',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            )
                          : Container()
                    ],
                  ),
                );
              },
              physics: ClampingScrollPhysics(),
              steps: steps,
              type: StepperType.vertical,
              currentStep: this.currStep,
              onStepContinue: () {
                setState(() {
                  if (formKeys[currStep].currentState.validate()) {
                    formKeys[currStep].currentState.save();
                    if (currStep < steps.length - 1) {
                      currStep = currStep + 1;
                    } else {
                      currStep = 0;
                    }
                  }
                });
              },
              onStepCancel: () {
                setState(() {
                  if (currStep > 0) {
                    currStep = currStep - 1;
                  } else {
                    currStep = 0;
                  }
                });
              },
              onStepTapped: (step) {
                setState(() {
                  currStep = step;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: RaisedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Próxima etapa ',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    FaIcon(FontAwesomeIcons.arrowRight,
                        color: Colors.white, size: 16)
                  ],
                ),
                onPressed: _submitForm,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ]),
        ));
  }
}
