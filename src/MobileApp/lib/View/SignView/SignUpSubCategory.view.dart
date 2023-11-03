// @dart=2.9
import 'dart:convert';

import 'package:ReachUp/Component/Database/Database.db.dart';
import 'package:ReachUp/Component/Dialog/CustomDialog.component.dart';
import 'package:ReachUp/Controller/Account.controller.dart';
import 'package:ReachUp/Controller/ClientPreference.controller.dart';
import 'package:ReachUp/Controller/SubCategory.controller.dart';
import 'package:ReachUp/Model/ClientPreference.model.dart';
import 'package:ReachUp/Model/Subcategory.model.dart';
import 'package:ReachUp/View/HomeView/Home.view.dart';
import 'package:ReachUp/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'SubCategoryCard.view.dart';

class SignUpSubCategory extends StatefulWidget {
  SignUpSubCategory();

  _SignUpSubCategoryState createState() => _SignUpSubCategoryState();
}

class _SignUpSubCategoryState extends State<SignUpSubCategory> {
  final ClientPreferenceController clientPreferenceController =
      new ClientPreferenceController();
  final SubCategoryController subCategoryController =
      new SubCategoryController();
  int categoryIndex = 0;

  @override
  initState() {
    super.initState();
  }

  @override
  void deactivate() {
    EasyLoading.dismiss();
    super.deactivate();
  }

  Widget buildListView(List<SubCategory> subCategoriesByCat) {
    return ListView.builder(
      itemCount: subCategoriesByCat.length,
      itemBuilder: (context, index) =>
          SubCategoryCard(subCategoriesByCat[index]),
    );
  }

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
          title: Text(
              " Para ${Globals.categoriesChecked[categoryIndex].categoryName}"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                            icon: Icons.info_outline,
                            title: "Info",
                            description:
                                "Selecione as especificações de suas preferências",
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
          child: Column(
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
                        categoryIndex == Globals.categoriesChecked.length - 2
                            ? 'Próxima etapa '
                            : "Finalizar",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      categoryIndex == Globals.categoriesChecked.length - 2
                          ? FaIcon(FontAwesomeIcons.arrowRight,
                              color: Colors.white, size: 16)
                          : Icon(Icons.check, color: Colors.white, size: 16)
                    ],
                  ),
                  onPressed: () {
                    if (Globals.subCategoriesChecked.isNotEmpty) {
                      if (categoryIndex <
                          Globals.categoriesChecked.length - 1) {
                        setState(() {
                          categoryIndex++;
                        });
                      } else {
                        EasyLoading.show(status: "Carregando...");
                        accountController.signUp().then((value) {
                          Globals.user = value;

                          ClientPreference newPreferences =
                              new ClientPreference()
                                ..clientEmail = Globals.user.email
                                ..subCategories = new List<SubCategory>();

                          Globals.subCategoriesChecked.forEach((element) {
                            newPreferences.subCategories.add(element);
                          });
                          clientPreferenceController
                              .add(newPreferences)
                              .then((value) {
                            EasyLoading.dismiss();
                            Database.insert(
                                key: "user",
                                value: jsonEncode(Globals.user.toJson()));
                            debugPrint(
                                "Local Database user:\n ${Database.select(key: 'user').response} ");
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home(isNoob: true)),
                              (Route<dynamic> route) => false,
                            );
                          });
                        });
                      }
                    } else
                      showSnackBarMessage(
                          context, "Escolha pelo menos um item!");
                  },
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ));
  }

  Widget bodyBuilder() {
    return FutureBuilder(
      future: subCategoryController
          .getByCategory(Globals.categoriesChecked[categoryIndex].categoryId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          EasyLoading.dismiss();

          return buildListView(snapshot.data);
        } else {
          return Builder(builder: (context) {
            EasyLoading.show(status: "Buscando itens...");
            return Container();
          });
        }
      },
    );
  }
}
