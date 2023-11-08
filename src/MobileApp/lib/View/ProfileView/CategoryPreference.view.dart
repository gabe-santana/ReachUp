// @dart=2.9
import 'package:ReachUp/Controller/Category.controller.dart';
import 'package:ReachUp/Controller/ClientPreference.controller.dart';
import 'package:ReachUp/Model/Category.model.dart';
import 'package:ReachUp/Model/ClientPreference.model.dart';
import 'package:ReachUp/Model/Subcategory.model.dart';
import 'package:ReachUp/View/SignView/CategoryStoreCard.view.dart';
import 'package:ReachUp/globals.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CategoryPreferenceView extends StatefulWidget {
  @override
  _CategoryPreferenceViewState createState() => _CategoryPreferenceViewState();
}

class _CategoryPreferenceViewState extends State<CategoryPreferenceView> {
  AsyncMemoizer _memoizer;
  final CategoryController _categoryController = new CategoryController();
  final ClientPreferenceController _clientPreferenceController =
      new ClientPreferenceController();

  Future _fetchData() async {
    return this._categoryController.getAll();
  }

  Widget buildListView(List<Category> categories) {
    List<CategoryStoreCard> cards =
        categories.map((e) => CategoryStoreCard(e)).toList();

    return Column(
      children: [
        Expanded(child: ListView(children: cards)),
        Positioned(
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                ClientPreference newPreferences = new ClientPreference()
                  ..clientEmail = Globals.user.email
                  ..subCategories = new List<SubCategory>();

                Globals.subCategoriesPreferenceChecked.forEach((element) {
                  newPreferences.subCategories.add(element);
                });

                EasyLoading.show(status: "Carregando...");
                _clientPreferenceController.add(newPreferences).then((value) {
                  EasyLoading.dismiss();
                  Navigator.pop(context);
                });
              },
              child: Container(
                height: 35,
                width: MediaQuery.of(context).size.width,
                color: Colors.green,
                child: Center(
                  child: Text(
                    "Adicionar",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ))
      ],
    );
  }

  @override
  initState() {
    super.initState();
    _memoizer = AsyncMemoizer();
  }

  @override
  void deactivate() {
    EasyLoading.dismiss();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
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
          }),
    );
  }
}
