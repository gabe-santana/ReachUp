import 'package:ReachUp/Controller/Category.controller.dart';
import 'package:ReachUp/Model/Category.model.dart';
import 'package:ReachUp/View/SignView/CategoryCard.view.dart';
import 'package:ReachUp/View/SignView/CategoryStoreCard.view.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AddSubCategoryToStoreView extends StatefulWidget {
  @override
  _AddSubCategoryToStoreViewState createState() =>
      _AddSubCategoryToStoreViewState();
}

class _AddSubCategoryToStoreViewState extends State<AddSubCategoryToStoreView> {
  AsyncMemoizer _memoizer;
  final CategoryController _categoryController = new CategoryController();

  Future _fetchData() async {
    return this._memoizer.runOnce(() async {
      return this._categoryController.getAll();
    });
  }

  Widget buildListView(List<Category> categories) {
    List<CategoryStoreCard> cards =
        categories.map((e) => CategoryStoreCard(e)).toList();

    return ListView(children: cards);
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
