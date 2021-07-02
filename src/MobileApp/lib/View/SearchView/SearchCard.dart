import 'package:ReachUp/Component/Dialog/CustomDialog.component.dart';
import 'package:ReachUp/Model/Local.dart';
import 'package:ReachUp/Repositories/Local.repository.dart';
import 'package:ReachUp/View/HomeView/Home.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../globals.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SearchCard extends StatefulWidget {
  final Local local;
  bool open = false;

  _toTime(String _hour) {
    String hour = _hour.substring(0, 2);
    String min = _hour.substring(3, 5);

    return TimeOfDay(hour: int.parse(hour), minute: int.parse(min));
  }

  _toDate(TimeOfDay t) {
    DateTime now = new DateTime.now();
    return new DateTime(now.year, now.month, now.day, t.hour, t.minute);
  }

  _inRange(TimeOfDay opening, TimeOfDay closing) {
    return _toDate(TimeOfDay.now()).isAfter(_toDate(opening)) &&
        _toDate(TimeOfDay.now()).isBefore(_toDate(closing));
  }

  SearchCard({Key key, @required this.local}) : super(key: key) {
    this.open =
        _inRange(_toTime(local.openingHour), _toTime(local.closingHour));
  }

  @override
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  void showSnackBarMessage(ctx, String message,
        [MaterialColor color = Colors.green]) {
      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ));
    }



  createAlertDialog(BuildContext context, Local local) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(
              icon: FontAwesomeIcons.mapMarkedAlt,
              title: "${local.name}",
              description: "Ir até ${local.name}?",
              buttonOK: IconButton(
                icon: Icon(
                  Icons.check,
                  size: 40,
                  color: Colors.green,
                ),
                onPressed: () {
                  //chamar rota
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(
                          inRouting: true,
                        ),
                      ));
                },
              ),
              buttonNO: IconButton(
                icon: Icon(
                  Icons.close,
                  size: 40,
                  color: Colors.red,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ));
  }

  String showSubcategories() {
    String _r = "";
    List<String> subcats = widget.local.descriptionSubCategories.split(",");

    int i = 0;
    subcats.forEach((subcat) {
      if (i <= 2) _r += subcat + " ";
    });

    return _r;
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
    
  secondaryActions: <Widget>[

    IconSlideAction(
      caption: 'Favoritar',
      color: Colors.red,
      icon: FontAwesomeIcons.heart,
      onTap: () {
        showSnackBarMessage(context, "${widget.local.name} Favoritado!");
      },
    ),
  ],
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Card(
        elevation: 2,
        child: InkWell(
          onTap: () {
            print("IDLOCAL: ${widget.local.idLocal}");
            createAlertDialog(context, widget.local);
          },
          child: Stack(
            children: [
              Row(children: <Widget>[
                Container(
                  height: 125,
                  width: MediaQuery.of(context).size.width * 0.30,
                  decoration: BoxDecoration(
                    border: Border(
                        // right: BorderSide(width: 1.0, color: Colors.grey),
                        ),
                  ),
                  child: Container(
                      height: 100,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(child: fetchLocalImage()),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: 150,
                          child: Text(
                            widget.local.name,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontSize: 18,
                                color:
                                    Theme.of(context).colorScheme.onBackground),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            "",
                            // showSubcategories(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          )),
                    ],
                  ),
                )
              ]),
              Positioned(
                  top: 10,
                  right: 10,
                  child: widget.local.type == 0
                      ? FaIcon(FontAwesomeIcons.store,
                          size: 25, color: Colors.orange)
                      : widget.local.type == 1
                          ? FaIcon(FontAwesomeIcons.hamburger,
                              size: 25, color: Colors.brown)
                          : widget.local.type == 2
                              ? FaIcon(FontAwesomeIcons.ticketAlt,
                                  size: 25, color: Colors.red)
                              : widget.local.type == 3
                                  ? FaIcon(FontAwesomeIcons.bath,
                                      size: 25, color: Colors.blue)
                                  : widget.local.type == 4 ||
                                          widget.local.type == 5 ||
                                          widget.local.type == 8
                                      ? FaIcon(FontAwesomeIcons.mapMarked,
                                          size: 25, color: Colors.purple)
                                      : widget.local.type == 6
                                          ? FaIcon(FontAwesomeIcons.tree,
                                              size: 25,
                                              color: Colors.greenAccent)
                                          : widget.local.type == 7
                                              ? FaIcon(
                                                  FontAwesomeIcons.dollarSign,
                                                  size: 25,
                                                  color: Colors.green)
                                              : null),
              Positioned(
                  bottom: 10,
                  right: 10,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Text(
                          widget.open ? "Aberto" : "Fechado",
                          style: TextStyle(
                              color: widget.open
                                  ? Colors.green
                                  : Theme.of(context).colorScheme.error,
                              fontSize: 16),
                        ),
                      ),
                      FaIcon(FontAwesomeIcons.solidClock,
                          size: 25,
                          color: widget.open
                              ? Colors.green
                              : Theme.of(context).colorScheme.error),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget fetchLocalImage() {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      httpHeaders: {"Authorization": "Bearer ${Globals.user.token}"},
      imageUrl: LocalRepository().getImage(widget.local),
      placeholder: (context, url) => CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary)),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
