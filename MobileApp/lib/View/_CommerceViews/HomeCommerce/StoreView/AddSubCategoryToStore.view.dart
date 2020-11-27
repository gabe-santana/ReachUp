import 'package:ReachUp/Controller/Category.controller.dart';
import 'package:ReachUp/Controller/Local.controller.dart';
import 'package:ReachUp/Model/Category.model.dart';
import 'package:ReachUp/Model/SubCategoryLocal.mode.dart';
import 'package:ReachUp/View/SignView/CategoryCard.view.dart';
import 'package:ReachUp/View/SignView/CategoryStoreCard.view.dart';
import 'package:ReachUp/globals.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AddSubCategoryToStoreView extends StatefulWidget {
  AddSubCategoryToStoreView() {
    Globals.subCategoriesStoreChecked.clear();
  }
  @override
  _AddSubCategoryToStoreViewState createState() =>
      _AddSubCategoryToStoreViewState();
}

class _AddSubCategoryToStoreViewState extends State<AddSubCategoryToStoreView> {
  AsyncMemoizer _memoizer;
  final CategoryController _categoryController = new CategoryController();
  final LocalController _localController = new LocalController();

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
                List<SubcategoriesLocal> listSubcategoriesLocal =
                    new List<SubcategoriesLocal>();

                Globals.subCategoriesStoreChecked.forEach((subcat) {
                  listSubcategoriesLocal.add(new SubcategoriesLocal(
                      local: Globals.user.admLocal,
                      subcategory: subcat,
                      category: subcat.category));
                });
                EasyLoading.show(status: "Salvando...");
                _localController
                    .addSubcategory(listSubcategoriesLocal)
                    .then((value) {
                  EasyLoading.dismiss();
                  listSubcategoriesLocal.forEach((subcat) {
                    Globals.subcategoriesLocal.add(subcat.subcategory);
                  });

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
