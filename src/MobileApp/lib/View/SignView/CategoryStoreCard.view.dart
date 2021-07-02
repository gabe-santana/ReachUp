import 'package:ReachUp/Controller/SubCategory.controller.dart';
import 'package:ReachUp/Model/Category.model.dart';
import 'package:ReachUp/Model/Subcategory.model.dart';
import 'package:ReachUp/Repositories/Category.repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../globals.dart';
import 'SubCategoryCard.view.dart';
import 'SubCategoryStoreCard.view.dart';

class CategoryStoreCard extends StatefulWidget {
  Category category;
  bool checked = false;

  CategoryStoreCard(this.category){
   
  }

  @override
  _CategoryStoreCardState createState() => _CategoryStoreCardState();
}

class _CategoryStoreCardState extends State<CategoryStoreCard> {
  SubCategoryController subCategoryController = new SubCategoryController();


  Widget buildListView(List<SubCategory> subCategoriesByCat) {
    // subCategoriesByCat.removeWhere((subcat) => Globals.subcategoriesLocal.contains(subcat));
    return ListView.builder(
      itemCount: subCategoriesByCat.length,
      itemBuilder: (context, index) => SubCategoryStoreCardView(
          subCategoriesByCat[index],
          isClientPreference: Globals.user.role == "cli"),
    );
  }

  @override
  void deactivate() {
    EasyLoading.dismiss();
    super.deactivate();
  }

  @override
  void initState() {
   
    super.initState();
 
  }
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                  child: Container(
                color: widget.checked ? Colors.grey[100] : Colors.white,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      widget.checked = !widget.checked;
                    });
                  },
                  child: (Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Container(
                          width: 70,
                          height: 70,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width,
                              httpHeaders: {
                                "Authorization": "Bearer ${Globals.user.token}"
                              },
                              imageUrl: CategoryRepository()
                                  .getImage(widget.category.categoryId),
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            Colors.grey)),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            child: Text(
                              widget.category.categoryName,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
                ),
              )),
              widget.checked
                  ? AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 300,
                      child: FutureBuilder(
                          future: subCategoryController
                              .getByCategory(widget.category.categoryId),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              EasyLoading.dismiss();

                              return Center(
                                  child: buildListView(snapshot.data));
                            } else {
                              return Builder(
                                builder: (context) {
                                  EasyLoading.show(status: "Buscando itens...");
                                  return Container();
                                },
                              );
                            }
                          }),
                    )
                  : Container()
            ],
          ),
        ));
  }
}
