import 'package:ReachUp/Model/Communique.model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommuniqueCard extends StatefulWidget {
  Communique communique;
  CommuniqueCard(this.communique);
  @override
  _CommuniqueCardState createState() => _CommuniqueCardState();
}

class _CommuniqueCardState extends State<CommuniqueCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          onTap: () {},
          child: Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Container(
                      child: Icon(
                        widget.communique.type == 0
                          ? FontAwesomeIcons.shoppingCart
                          : widget.communique.type == 1
                              ? Icons.chat
                              : widget.communique.type == 2
                                  ? Icons.notifications
                                  : widget.communique.type == 3
                                      ? Icons.report
                                      : Icons.error,

                                      color:         
                                  widget.communique.type == 0 ? Colors.orange[300]
                          : widget.communique.type == 1
                              ?  Colors.purple[300]
                              : widget.communique.type == 2
                                  ?  Colors.yellow[300]
                                  : widget.communique.type == 3
                                      ? Colors.red[300]
                                      : Colors.red
                                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      widget.communique.description,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 15),
                    ),
                  ),
                ],
              ))),
    );
  }
}
