import 'package:ReachUp/Model/Local.dart';
import 'package:ReachUp/Model/Subcategory.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchCard extends StatefulWidget {
  final Local local;

  const SearchCard({Key key, @required this.local}) : super(key: key);

  @override
  _SearchCardState createState() => _SearchCardState();
}




Text buildSubCat(List<SubCategory> subCategories){
  String subcats = "";
  int i = 0;
  for (SubCategory subcat in subCategories) {

    if(i>2){
      break;
    }
    subcats+= "${subcat.subCategoryName}, ";    
    i++;   
  }

  return Text(subcats, style: TextStyle(
   fontSize: 20,
   color: Colors.grey 
  ),);
}
class _SearchCardState extends State<SearchCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
    
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
             
         
          print('Card tapped.');
        },
        child: Row(
          children: <Widget>[
           Container(
             height: 125,
             width: MediaQuery.of(context).size.width * 0.30,
             decoration: BoxDecoration(
               border: Border(
                  right: BorderSide(width: 1.0, color: Colors.grey),
                ),
             ),
             child: Center(
               child: 
               Text("image", style: TextStyle(
                 color: Colors.grey
               ),)
             ),
           ),
             Padding(
               padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Container(
                     child: Text(widget.local.name)
                     ),
                   Container(
                     padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                     width: MediaQuery.of(context).size.width*0.5,
                     child: buildSubCat(widget.local.subCategories)
                     ),

                 ],
               )
             )
          ],
        ),
      ),
    );
  }
}