import 'package:ReachUp/Model/Subcategory.model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../globals.dart';

class SubCategoryCard extends StatefulWidget {
  SubCategory subCategory;

  bool checked = false;


    SubCategoryCard(this.subCategory);
  @override
  _SubCategoryCardState createState() => _SubCategoryCardState();
}

class _SubCategoryCardState extends State<SubCategoryCard> {
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
                      child: Center(
                        child: FaIcon(FontAwesomeIcons.image,
                            color: Colors.grey, size: 60),
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
                              color: Theme.of(context).colorScheme.onBackground,
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

                  
                  if(val){
                    Globals.subCategoriesChecked.add(widget.subCategory);
                  }else{
                    Globals.subCategoriesChecked.removeWhere((ctg) => ctg == widget.subCategory);
                  }
                });
              }),
        ),
      ),
    );
  }
}
