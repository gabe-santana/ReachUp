import 'package:flutter/material.dart';

class SearchCard extends StatefulWidget {
  @override
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
     
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
                   Text("Local name"),
                   Text("Local subcategories", style: TextStyle(
                     fontSize: 20,
                     color: Colors.grey
                   ),),
                   
                 ],
               )
             )
          ],
        ),
      ),
    );
  }
}