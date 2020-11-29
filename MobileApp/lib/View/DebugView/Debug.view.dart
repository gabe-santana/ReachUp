import 'package:ReachUp/Component/Dialog/CustomDialog.component.dart';
import 'package:ReachUp/View/HomeView/Home.view.dart';
import 'package:ReachUp/View/SignView/Sign.view.dart';
import 'package:ReachUp/View/SignView/SignIn.view.dart';
import 'package:ReachUp/View/_CommerceViews/HomeCommerce/HomeView/HomeCommerce.view.dart';
import 'package:ReachUp/View/splashscreen.view.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../globals.dart';

class DebugView extends StatefulWidget {
  DebugView() {}
  @override
  _DebugViewState createState() => _DebugViewState();
}

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _DebugViewState extends State<DebugView> {
  GlobalKey<NavigatorState> navigateKey = GlobalKey<NavigatorState>();

  Future<bool> _backPressed(GlobalKey<NavigatorState> _navigateKey) async {
    if (_navigateKey.currentState.canPop()) {
      _navigateKey.currentState.maybePop();
      return Future<bool>.value(false);
    }
    return Future<bool>.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _backPressed(navigateKey),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Debug view"),
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomDialog(
                              icon: Icons.info_outline,
                              title: "Info",
                              description: "View for debug",
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
          body: Center(
              child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  child: CheckboxListTile(
                    title: Text("Entrar como lojista"),
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: VersionConfig.isCommerceVersion,
                    onChanged: (value) {
                      setState(() {
                        VersionConfig.isCommerceVersion = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: Container(
                    width: 200,
                    child: TextFormField(
                      initialValue: "192.168.0.105",
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                      onSaved: (value) {
                        Globals.urlAPI = "http://$value:8000/api";
                      },
                      maxLines: 1,
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'IP Inválido!';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Server IPv4',
                          hintText: 'Server IPv4',
                          icon: const Icon(Icons.computer),
                          labelStyle: TextStyle(
                              decorationStyle: TextDecorationStyle.solid)),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      debugPrint("URL API: ${Globals.urlAPI}\n");
                      Globals.isLoggedIn
                          ? Globals.user.role == "cli"
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Home()))
                              : MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomeCommerceView())
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      VersionConfig.isCommerceVersion
                                          ? Splash(SignInView())
                                          : Splash(SignView())));
                    }
                  },
                  color: Theme.of(context).colorScheme.primary,
                  child: Text("Submit", style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ))),
    );
  }
}
