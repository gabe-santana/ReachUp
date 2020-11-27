import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackView extends StatefulWidget {
  @override
  _FeedbackViewState createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  List<String> ddbItems = [
    "Banheiros",
    "Escadas",
    "Escadas rolantes",
    "Elevadores",
    "Corredores",
    "Praça de alimentação",
    "Rotas"
  ];

  int indexddbItems = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: RatingBar.builder(
                      initialRating: 5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: DropdownButton<String>(
                        value: ddbItems[indexddbItems],
                        items: ddbItems.map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value,
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground)),
                          );
                        }).toList(),
                        onChanged: (selectedItem) {
                          setState(() {
                            indexddbItems = ddbItems.indexOf(selectedItem);
                          });
                        }),
                  ),
                  TextFormField(
                    decoration: new InputDecoration(
                        labelText: "Descrição",
                        alignLabelWithHint: true,
                        hintText: "Descreva seu feedback",
                        hintStyle: TextStyle(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        )),
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    maxLength: 1000,
                    onSaved: (value) {},
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Campo obrigatório!";
                      }
                    },
                  ),
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      color: Colors.green,
                      onPressed: () {},
                      child: Text(
                        "Enviar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
