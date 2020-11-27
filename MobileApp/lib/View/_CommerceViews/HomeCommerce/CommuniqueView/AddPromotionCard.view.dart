import 'package:ReachUp/Repositories/SubCategory.repository.dart';
import 'package:ReachUp/globals.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AddPromotionCardView extends StatefulWidget {
  int index;
  bool checked;

  AddPromotionCardView(this.index) {
    this.checked = Globals.subCategoriesPromotionChecked
        .contains(Globals.subcategoriesLocal[index]);
  }

  @override
  _AddPromotionCardViewState createState() => _AddPromotionCardViewState();
}

class _AddPromotionCardViewState extends State<AddPromotionCardView> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      activeColor: Theme.of(context).primaryColor,
      onChanged: (val) {
        setState(() {
          widget.checked = val;

          if (val) {
            Globals.subCategoriesPromotionChecked
                .add(Globals.subcategoriesLocal[widget.index]);
          } else {
            Globals.subCategoriesPromotionChecked.removeWhere((element) =>
                element == Globals.subcategoriesLocal[widget.index]);
          }
        });
      },
      value: widget.checked,
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Container(
                height: 50,
                width: 50,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  httpHeaders: {
                    "Authorization": "Bearer ${Globals.user.token}"
                  },
                  imageUrl: SubCategoryRepository().getImage(
                      Globals
                          .subcategoriesLocal[widget.index].category.categoryId,
                      Globals.subcategoriesLocal[widget.index].subCategoryId),
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.grey)),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${Globals.subcategoriesLocal[widget.index].category.categoryName}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 16),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      "${Globals.subcategoriesLocal[widget.index].subCategoryName}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
