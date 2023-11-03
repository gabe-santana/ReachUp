// @dart=2.9
import 'package:ReachUp/Model/Communique.model.dart';
import 'package:ReachUp/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CommuniqueCard extends StatefulWidget {
  Communique communique;
  final Function(Communique communique, bool remove) onSelected;

  CommuniqueCard({this.communique, this.onSelected});

  @override
  _CommuniqueCardState createState() => _CommuniqueCardState();
}

class _CommuniqueCardState extends State<CommuniqueCard> {
  bool widgetSelected = false;

  selectWidget() {
    widget.onSelected(widget.communique, widgetSelected);
  }

  @override
  void deactivate() {
    EasyLoading.dismiss();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    widgetSelected = Globals.selectedCommuniques.contains(widget.communique);
    return Card(
      elevation: widgetSelected ? 4 : 1,
      color: widgetSelected ? Colors.grey[300] : Colors.white,
      child: InkWell(
          onLongPress: () => selectWidget(),
          onTap: () {
            if (Globals.selectedCommuniques.isNotEmpty) {
              selectWidget();
            }
          },
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
                          color: widget.communique.type == 0
                              ? Colors.orange[300]
                              : widget.communique.type == 1
                                  ? Colors.purple[300]
                                  : widget.communique.type == 2
                                      ? Colors.yellow[300]
                                      : widget.communique.type == 3
                                          ? Colors.red[300]
                                          : Colors.red),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Text(
                      widget.communique.description,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Icon(Icons.date_range,
                        color: isCurrentDateInRange(widget.communique.startDate,
                                widget.communique.endDate)
                            ? Colors.green
                            : Colors.red),
                  )
                ],
              ))),
    );
  }

  bool isCurrentDateInRange(DateTime startDate, DateTime endDate) {
    final currentDate = DateTime.now();
    print(
        "Hoje é $currentDate\nComunicado começou em $startDate e terminou em $endDate");

    startDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate.toString());
    endDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(endDate.toString());
    return currentDate.isAfter(startDate) && currentDate.isBefore(endDate);
  }
}
