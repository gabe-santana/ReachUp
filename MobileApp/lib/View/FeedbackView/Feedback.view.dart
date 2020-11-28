import 'package:ReachUp/Controller/Feedback.controller.dart';
import 'package:ReachUp/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ReachUp/Model/Feedback.model.dart' as RFeedback;

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

  FeedbackController feedbackController = new FeedbackController();
  RFeedback.Feedback feedback = new RFeedback.Feedback();

  double rating = 3;
  bool finished = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: finished
            ? Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Text(
                          "Feedback Enviado!",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontSize: 20),
                        ),
                      ),
                      ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width * 0.6,
                        child: RaisedButton(
                          color: Colors.green,
                          onPressed: () {
                            setState(() {
                              finished = false;
                            });
                          },
                          child: Text(
                            "Enviar outro feedback",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width * 0.6,
                        child: RaisedButton(
                          color: Theme.of(context).colorScheme.primary,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Pronto",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Form(
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
                            initialRating: rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (_rating) {
                              rating = _rating;
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
                                  indexddbItems =
                                      ddbItems.indexOf(selectedItem);
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
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              )),
                          keyboardType: TextInputType.multiline,
                          maxLines: 8,
                          maxLength: 1000,
                          onSaved: (value) {
                            feedback.description = value;
                          },
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
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                feedback.feedbackId = 0;
                                feedback.stars = rating.round();
                                feedback.type = indexddbItems;
                                feedback.feedbackUser = Globals.user;
                                feedback.feedbackDate =
                                    DateTime.now().toString();

                                feedbackController.add(feedback).then((value) {
                                  setState(() {
                                    finished = true;
                                  });
                                });
                              }
                            },
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
