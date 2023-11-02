// @dart=2.9
import 'package:ReachUp/Model/Category.model.dart';
import 'package:ReachUp/Repositories/Category.repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../globals.dart';

class CategoryCardView extends StatefulWidget {
  @override
  _CategoryCardViewState createState() => _CategoryCardViewState();
  Category category;
  bool checked = false;

  CategoryCardView(this.category);
}

class _CategoryCardViewState extends State<CategoryCardView> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Card(
        child: InkWell(
          splashColor: Theme.of(context).primaryColor,
          child: CheckboxListTile(
              activeColor: Theme.of(context).primaryColor,
              title: Row(
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
                                valueColor: new AlwaysStoppedAnimation<Color>(
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
                              color: Theme.of(context).colorScheme.onBackground,
                              fontSize: 18),
                        ),
                      ),
                      // Text(widget.category.categoryDescription,
                      // overflow: TextOverflow.clip,
                      // style: TextStyle(
                      //   color: Colors.grey,
                      //   fontSize: 12,
                      // ),)
                    ],
                  )
                ],
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              value: widget.checked,
              onChanged: (val) {
                setState(() {
                  widget.checked = val;

                  if (val) {
                    Globals.categoriesChecked.add(widget.category);
                  } else {
                    Globals.categoriesChecked
                        .removeWhere((ctg) => ctg == widget.category);
                  }
                });
              }),
        ),
      ),
    );
  }
}
