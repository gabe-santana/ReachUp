import 'package:ReachUp/Component/Dialog/CustomDialog.component.dart';
import 'package:ReachUp/Controller/Category.controller.dart';
import 'package:ReachUp/Model/Category.model.dart';
import 'package:ReachUp/View/HomeView/Home.view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../globals.dart';
import 'CategoryCard.view.dart';

class SignUpPreferencesView extends StatefulWidget {
  @override
  _SignUpPreferencesViewState createState() => _SignUpPreferencesViewState();
}

class _SignUpPreferencesViewState extends State<SignUpPreferencesView> {
  final CategoryController _categoryController = new CategoryController();

  @override
  initState() {
    // _categoryController.getAll().then((value) => () {
    //       categories = value;
    //     });
    super.initState();
  }
 Key _listKey = Key("sa");

  buildListView(List<Category> categories) {
    // print(widget.categories.length);
    return ListView.builder(
      key: _listKey,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCardView(categories[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Preferências"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                            icon: Icons.info_outline,
                            title: "Info",
                            description: "Sabendo de suas preferências podemos\n" +
                                "te ajudar a encontrar o que você procura mais rápidamente!",
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
        body: Builder(builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: bodyBuilder(),
              ),
              SnackBarPage()
            ],
          );
        }));
  }

  Widget bodyBuilder() {
    return Container(
        child: FutureBuilder(
            future: this._categoryController.getAll(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(child: buildListView(snapshot.data));
              } else {
                return Center(
                  child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.primary)),
                );
              }
            }));
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: RaisedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Próxima etapa ',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              FaIcon(FontAwesomeIcons.arrowRight, color: Colors.white, size: 16)
            ],
          ),
          onPressed: () {},
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
