import 'package:ReachUp/Component/Dialog/CustomDialog.component.dart';
import 'package:ReachUp/Controller/Account.controller.dart';
import 'package:ReachUp/View/HomeView/Home.view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../globals.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  AccountController accountController = new AccountController();
 
  @override
  Widget build(BuildContext context) {

        void showSnackBarMessage(ctx, String message,
        [MaterialColor color = Colors.red]) {
      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ));
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Entrar"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                            icon: Icons.info_outline,
                            title: "Info",
                            description: "Informe seus dados para entrar",
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
        body: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    initialValue: "",
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    onSaved: (value) {
                      Globals.user.email = value;
                    },
                    maxLines: 1,
                    //initialValue: 'Aseem Wangoo',
                    validator: (value) {
                      if (value.isEmpty ||
                          !value.contains('@') ||
                          !value.contains('.')) {
                        return 'E-mail inválido!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'E-mail',
                        hintText: 'examplo@email.com',
                        //filled: true,
                        icon: const Icon(Icons.email),
                        labelStyle: TextStyle(
                            decorationStyle: TextDecorationStyle.solid)),
                  ),
                  TextFormField(
                    obscureText: true,
                    initialValue: "",
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    onSaved: (value) {
                      Globals.user.password = value;
                    },
                    maxLines: 1,
                    //initialValue: 'Aseem Wangoo',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite uma senha!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Senha',
                        hintText: 'Sua senha',
                        //filled: true,
                        icon: const FaIcon(FontAwesomeIcons.key),
                        labelStyle: TextStyle(
                            decorationStyle: TextDecorationStyle.solid)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Entrar ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            FaIcon(
                              FontAwesomeIcons.signInAlt,
                              color: Colors.white,
                              size: 16,
                            )
                          ],
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            Globals.user.role = "cli";
                            accountController.signIn().then((value) {
                              if (value != null) {
                                Globals.user = value;

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                  (Route<dynamic> route) => false,
                                );
                              } else {
                                showSnackBarMessage(
                                    context, "Usuário inexistente!");
                              }
                            });
                          } else {
                            showSnackBarMessage(
                                context, "Preencha os campos corretamente!");
                          }
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: FlatButton(
                        child: Text(
                          "Esqueci minha senha",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        onPressed: () {},
                        color: Colors.transparent),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
