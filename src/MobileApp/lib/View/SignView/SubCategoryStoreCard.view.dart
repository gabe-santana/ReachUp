// @dart=2.9
import 'package:ReachUp/Model/Subcategory.model.dart';
import 'package:ReachUp/Repositories/SubCategory.repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../globals.dart';

class SubCategoryStoreCardView extends StatefulWidget {
  SubCategory subCategory;

  bool checked;
  bool exists;
  bool isClientPreference;

  SubCategoryStoreCardView(this.subCategory,
      {this.isClientPreference = false}) {
    if (isClientPreference) {
      this.checked =
          Globals.subCategoriesPreferenceChecked.contains(this.subCategory);
      this.exists =
          Globals.userPreference.subCategories.contains(this.subCategory);
    } else {
      this.checked =
          Globals.subCategoriesStoreChecked.contains(this.subCategory);
      this.exists = Globals.subcategoriesLocal.contains(this.subCategory);
    }
  }

  @override
  _SubCategoryStoreCardViewState createState() =>
      _SubCategoryStoreCardViewState();
}

class _SubCategoryStoreCardViewState extends State<SubCategoryStoreCardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      alignment: Alignment.center,
      child: Card(
        child: Container(
          color: Colors.grey[100],
          child: InkWell(
            splashColor: Theme.of(context).primaryColor,
            child: widget.exists
                ? Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Container(
                          width: 40,
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              httpHeaders: {
                                "Authorization": "Bearer ${Globals.user.token}"
                              },
                              imageUrl: SubCategoryRepository().getImage(
                                  widget.subCategory.category.categoryId,
                                  widget.subCategory.subCategoryId),
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
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              "${widget.subCategory.subCategoryName} (Já adicionado)",
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
                  )
                : CheckboxListTile(
                    activeColor: Theme.of(context).primaryColor,
                    title: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Container(
                            width: 40,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width,
                                httpHeaders: {
                                  "Authorization":
                                      "Bearer ${Globals.user.token}"
                                },
                                imageUrl: SubCategoryRepository().getImage(
                                    widget.subCategory.category.categoryId,
                                    widget.subCategory.subCategoryId),
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
                                widget.subCategory.subCategoryName,
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
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: widget.checked,
                    onChanged: (val) {
                      setState(() {
                        widget.checked = val;
                        if (widget.isClientPreference) {
                          if (val) {
                            Globals.subCategoriesPreferenceChecked
                                .add(widget.subCategory);
                          } else {
                            Globals.subCategoriesPreferenceChecked.removeWhere(
                                (ctg) => ctg == widget.subCategory);
                          }
                        } else {
                          if (val) {
                            Globals.subCategoriesStoreChecked
                                .add(widget.subCategory);
                          } else {
                            Globals.subCategoriesStoreChecked.removeWhere(
                                (ctg) => ctg == widget.subCategory);
                          }
                        }
                      });
                    }),
          ),
        ),
      ),
    );
  }
}
