import 'package:ReachUp/Component/Dialog/CustomDialog.component.dart';
import 'package:ReachUp/Controller/Category.controller.dart';
import 'package:ReachUp/Controller/SubCategory.controller.dart';
import 'package:ReachUp/Model/Category.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:async/async.dart';
import '../../globals.dart';
import 'CategoryCard.view.dart';
import 'SignUpSubCategory.view.dart';

class SignUpPreferencesView extends StatefulWidget {
  @override
  _SignUpPreferencesViewState createState() => _SignUpPreferencesViewState();
}

class _SignUpPreferencesViewState extends State<SignUpPreferencesView> {
  AsyncMemoizer _memoizer;

  final CategoryController _categoryController = new CategoryController();

  bool accepted = false;

  @override
  initState() {
    // _categoryController.getAll().then((value) => () {
    //       categories = value;
    //     });
    super.initState();
    _memoizer = AsyncMemoizer();
  }

  @override
  void deactivate() {
    EasyLoading.dismiss();
    super.deactivate();
  }

  _fetchData() {
    return this._memoizer.runOnce(() async {
      return this._categoryController.getAll();
    });
  }

  Widget buildListView(List<Category> categories) {
    List<CategoryCardView> cards =
        categories.map((e) => CategoryCardView(e)).toList();

    return ListView(children: cards);
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

    SubCategoryController subCategoryController = new SubCategoryController();
    return Scaffold(
        appBar: AppBar(
          title: Text("Minhas Preferências"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                            icon: Icons.info_outline,
                            title: "Info",
                            description: accepted
                                ? "Sabendo de suas preferências podemos\n" +
                                    "te ajudar a encontrar o que você procura mais rápidamente!"
                                : "Selecione as categorias que mais se identifique!",
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
          return accepted
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: bodyBuilder(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: RaisedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Próxima etapa ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            FaIcon(FontAwesomeIcons.arrowRight,
                                color: Colors.white, size: 16)
                          ],
                        ),
                        onPressed: () {
                          if (Globals.categoriesChecked.isNotEmpty) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpSubCategory()));
                          } else
                            showSnackBarMessage(
                                context, "Escolha pelo menos uma categoria!");
                        },
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                )
              : AnimatedContainer(
                  duration: Duration(seconds: 2),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Suas preferências nos importam!",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 50, 10, 30),
                          child: Container(
                            width: 350,
                            child: Text(
                              "Sabendo suas preferências seremos capazes de te ajudar em:",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_box,
                              color: Colors.green,
                            ),
                            Text(
                              "Encontrar o que procura",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 10)),
                            Icon(
                              Icons.check_box,
                              color: Colors.green,
                            ),
                            Text(
                              "Direcionar promoções",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 10)),
                            Icon(
                              Icons.check_box,
                              color: Colors.green,
                            ),
                            Text(
                              "Filtrar dados externos",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                          child: RaisedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Escolher preferências ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                FaIcon(FontAwesomeIcons.arrowRight,
                                    color: Colors.white, size: 16)
                              ],
                            ),
                            onPressed: () {
                              setState(() {
                                this.accepted = true;
                              });
                            },
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                          child: FlatButton(
                              child: Text(
                                "Fazer isso depois",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              onPressed: () {},
                              color: Colors.transparent),
                        ),
                      ],
                    ),
                  ));
        }));
  }

  Widget bodyBuilder() {
    return Container(
        child: FutureBuilder(
            future: _fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                EasyLoading.dismiss();
                return Center(child: buildListView(snapshot.data));
              } else {
                return Builder(
                  builder: (context) {
                    EasyLoading.show(status: "Buscando itens...");
                    return Container();
                  },
                );
              }
            }));
  }
}
