import 'package:ReachUp/Component/Dialog/CustomDialog.component.dart';
import 'package:ReachUp/Controller/Account.controller.dart';
import 'package:ReachUp/Controller/SubCategory.controller.dart';
import 'package:ReachUp/Model/Subcategory.model.dart';
import 'package:ReachUp/View/HomeView/Home.view.dart';
import 'package:ReachUp/globals.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'SubCategoryCard.view.dart';

class SignUpSubCategory extends StatefulWidget {
  SignUpSubCategory();

  _SignUpSubCategoryState createState() => _SignUpSubCategoryState();
}

class _SignUpSubCategoryState extends State<SignUpSubCategory> {
  SubCategoryController subCategoryController = new SubCategoryController();
  int categoryIndex = 0;

  @override
  initState() {
    super.initState();
  }

  Widget buildListView(List<SubCategory> subCategoriesByCat) {
    print("length");
    print(subCategoriesByCat.length);

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
                    print("index cat");
                    print(Globals.categoriesChecked.length - categoryIndex);
                    if (Globals.subCategoriesChecked.isNotEmpty) {
                      if (categoryIndex <
                          Globals.categoriesChecked.length - 1) {
                        setState(() {
                          categoryIndex++;
                        });
                      } else {
                        accountController.signUp().then((value) {
                          Globals.user = value;
                        });
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                          (Route<dynamic> route) => false,
                        );
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
          debugPrint('Step 3, build widget: ${snapshot.data}');
          // Build the widget with data.
          return buildListView(snapshot.data);
        } else {
          // We can show the loading view until the data comes back.
          debugPrint('Step 1, build loading widget');
          return Center(
              child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.primary)));
        }
      },
    );
  }
}
