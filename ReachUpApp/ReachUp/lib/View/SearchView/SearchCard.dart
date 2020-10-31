import 'package:ReachUp/Model/Local.dart';
import 'package:ReachUp/Model/Subcategory.model.dart';
import 'package:ReachUp/View/HomeView/Home.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

class CustomDialog extends StatelessWidget {
  final String title, description;
  Widget buttonOK;
  Widget buttonNO;
  final Image image;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonOK,
    @required this.buttonNO,
    this.image,
  });

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end, 
                    children: [buttonNO, buttonOK]),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Consts.padding,
          right: Consts.padding,
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: Consts.avatarRadius,
            child: FaIcon(FontAwesomeIcons.mapMarkedAlt, size: 50, color: Colors.white,),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

class SearchCard extends StatefulWidget {
  final Local local;

  const SearchCard({Key key, @required this.local}) : super(key: key);

  @override
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  createAlertDialog(BuildContext context, Local local) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(
              title: "${local.name}",
              description: "Ir até ${local.name}?",
              buttonOK: IconButton(
                icon: Icon(Icons.check,  size: 40, color: Colors.green,),
                onPressed: (){
                    //chamar rota
                    Navigator.pop(context);
                    Navigator.pop(context, true);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(inRouting: true,),));
                    
                },
              ),
              buttonNO: IconButton(
                icon: Icon(Icons.close,  size: 40, color: Colors.red,),
                onPressed: (){
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
    return Card(
      elevation: 3,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
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
                child: Center(
                  child: FaIcon(
                      widget.local.type == 0
                          ? FontAwesomeIcons.store
                          : widget.local.type == 1
                              ? FontAwesomeIcons.hamburger
                              : widget.local.type == 2
                                  ? FontAwesomeIcons.film
                                  : widget.local.type == 3
                                      ? FontAwesomeIcons.bath
                                      : widget.local.type == 4
                                          ? FontAwesomeIcons.lastfm
                                          : FontAwesomeIcons.store,
                      size: 40,
                      color: Color(0xFF545454)),
                ),
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
                          ),
                        )),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          showSubcategories(),
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
                child: widget.local.type == 0 ||
                        widget.local.type == 1 ||
                        widget.local.type == 2
                    ? FaIcon(FontAwesomeIcons.shoppingBag,
                        size: 25, color: Colors.orange)
                    : widget.local.type == 3
                        ? FaIcon(FontAwesomeIcons.bath,
                            size: 25, color: Colors.blue)
                        : null),
            Positioned(
                bottom: 10,
                right: 10,
                child: FaIcon(FontAwesomeIcons.doorOpen,
                    size: 25, color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
