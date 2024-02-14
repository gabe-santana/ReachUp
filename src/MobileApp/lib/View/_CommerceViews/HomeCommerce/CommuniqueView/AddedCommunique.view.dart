// @dart=2.9
import 'package:flutter/material.dart';

class AddedCommuniqueView extends StatelessWidget {
  final Function(bool _new) newCommunique;
  AddedCommuniqueView({this.newCommunique});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Text(
            "Anúncio adiconado!",
            style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 20),
          ),
        ),
        ButtonTheme(
          minWidth: MediaQuery.of(context).size.width * 0.6,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
            onPressed: () {
              newCommunique(true);
            },
            child: Text(
              "Adicionar outro anúncio",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        ButtonTheme(
          minWidth: MediaQuery.of(context).size.width * 0.6,
          child: ElevatedButton(
             style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context)
                  .colorScheme
                  .primary),
              ),
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
    ));
  }
}
