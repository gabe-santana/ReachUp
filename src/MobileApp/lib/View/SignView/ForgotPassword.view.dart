// @dart=2.9
import 'package:ReachUp/Component/Dialog/CustomDialog.component.dart';
import 'package:ReachUp/Controller/Account.controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../globals.dart';

class ForgotPasswordView extends StatefulWidget {
  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  AccountController accountController = new AccountController();

  int tabIndex = 0;
  @override
  void deactivate() {
    EasyLoading.dismiss();
    super.deactivate();
  }

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
          title: Text("Recuperação de Senha"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                            icon: Icons.info_outline,
                            title: "Info",
                            description:
                                "Enviaremos um código de validação para seu E-mail",
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
        body: Builder(
          builder: (context) => Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      autofocus: true,
                      initialValue: "",
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      onSaved: (value) {
                        Globals.user.email = value;
                      },
                      maxLines: 1,
                      validator: (value) {
                        if (value.isEmpty ||
                            !value.contains('@') ||
                            !value.contains('.')) {
                          return 'E-mail inválido!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Informe seu E-mail',
                          hintText: 'examplo@email.com',
                          //filled: true,
                          icon: const Icon(Icons.email),
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
                                  "Próximo Passo ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                FaIcon(
                                  FontAwesomeIcons.arrowRight,
                                  color: Colors.white,
                                  size: 16,
                                )
                              ],
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();

                                EasyLoading.show(status: "Carregando...");
                                accountController.checkEmail().then((value) {
                                  EasyLoading.dismiss();
                                  if (!value) {
                                    showSnackBarMessage(
                                        context, "E-mail inexistente!");
                                  }
                                });
                              } else {
                                showSnackBarMessage(
                                    context, "Preencha todos os campos!");
                              }
                            })),
                    FlatButton(
                        child: Text(
                          "Cancelar",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.transparent),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
