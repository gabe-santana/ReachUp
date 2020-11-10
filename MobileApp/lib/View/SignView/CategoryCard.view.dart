import 'package:ReachUp/Model/Category.model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryCardView extends StatefulWidget {
  @override
  _CategoryCardViewState createState() => _CategoryCardViewState();
  Category category;

  CategoryCardView(this.category);
}

class _CategoryCardViewState extends State<CategoryCardView> {
  bool _checked = false;
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
                      width: MediaQuery.of(context).size.width * 0.30,
                      height: 100,
                      color: Colors.black,
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
              value: _checked,
              onChanged: (val) {
                setState(() {
                  _checked = val;
                });
              }),
        ),
      ),
    );
  }
}
