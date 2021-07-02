import 'package:ReachUp/Component/Dialog/CustomDialog.component.dart';
import 'package:ReachUp/Controller/Communique.controller.dart';
import 'package:ReachUp/Controller/SubCategory.controller.dart';
import 'package:ReachUp/Model/Communique.model.dart';
import 'package:ReachUp/Model/CommuniqueSubCategory.model.dart';
import 'package:ReachUp/globals.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'AddPromotionCard.view.dart';

class AddPromotionView extends StatefulWidget {
  Communique communique;

  AddPromotionView({this.communique}){
    Globals.communiqueSubCategories.clear();
  }
  @override
  _AddPromotionViewState createState() => _AddPromotionViewState();
}

class _AddPromotionViewState extends State<AddPromotionView> {
  SubCategoryController subCategoryController = new SubCategoryController();
  CommuniqueController communiqueController = new CommuniqueController();

  AsyncMemoizer _memoizer;
  @override
  initState() {
    // _categoryController.getAll().then((value) => () {
    //       categories = value;
    //     });
    super.initState();
    _memoizer = AsyncMemoizer();
  }

  buildlistView() {
    _memoizer.runOnce(() {
      EasyLoading.show(status: "Carregando...");
      subCategoryController
          .getByLocal(Globals.user.admLocal.idLocal)
          .then((value) {
        EasyLoading.dismiss();
        setState(() {
          Globals.subcategoriesLocal = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: [
      Container(
        child: Builder(builder: (context) {
          buildlistView();
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: ListView.builder(
                itemCount: Globals.subcategoriesLocal.length,
                itemBuilder: (context, index) => AddPromotionCardView(index)),
          );
        }),
      ),
      Positioned(
          bottom: 0,
          child: GestureDetector(
            onTap: () {
             
              Globals.subCategoriesPromotionChecked.forEach((element) { 
                Globals.communiqueSubCategories.add(
                  CommuniqueSubCategory(
                    communique: widget.communique,
                    category: element.category,
                    subcategory: element
                  )
                );
              });
              Navigator.pop(context);
              // communiqueController.bindSubCategories(Globals.communiqueSubCategories);
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
    ]));
  }
}
