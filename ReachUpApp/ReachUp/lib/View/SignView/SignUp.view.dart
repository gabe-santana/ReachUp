import 'package:ReachUp/Model/User.model.dart';
import 'package:fa_stepper/fa_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _focusNode = FocusNode();

List<GlobalKey<FormState>> formKeys = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>()
];

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class MyData {
  String name = '';
  String phone = '';
  String email = '';
  String age = '';
}

class _SignUpState extends State<SignUp> {
  User user = new User();
  final _formKey = GlobalKey<FormState>();
  bool nameStep = true;
  bool emailStep = false;
  bool pwdStep = false;
  int currentStep;

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
        appBar: AppBar(
          title: Text("Criar uma nova conta"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.info_outline, color: Colors.white))
          ],
        ),
        resizeToAvoidBottomInset: true,
        body: Align(
          alignment: Alignment.center,
          child: Column(children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)), 
            SignInButtonBuilder(
              icon: FontAwesomeIcons.google,
              width: MediaQuery.of(context).size.width * 0.7,
              text: "Cadastre-se com Google",
              onPressed: () {},
              backgroundColor: Color(0xFFCB1F27),
            ),
            SignInButtonBuilder(
              icon: FontAwesomeIcons.facebookF,
              width: MediaQuery.of(context).size.width * 0.7,
              text: "Cadastre-se com Facebook",
              onPressed: () {},
              backgroundColor: Color(0xFF3B5998),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
            Expanded(child: StepperBody()),
          ]),
        ));
  }
}

class StepperBody extends StatefulWidget {
  @override
  _StepperBodyState createState() => _StepperBodyState();
}

class _StepperBodyState extends State<StepperBody> {
  int currStep = 0;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static MyData data = MyData();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
      print('Has focus: $_focusNode.hasFocus');
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  List<Step> steps = [
    Step(
        title: const Text('Nome'),
        subtitle: const Text('Como devemos chamá-lo(a)?'),
        isActive: true,
        //state: StepState.error,
        state: StepState.indexed,
        content: Form(
          key: formKeys[0],
          child: Column(
            children: <Widget>[
              TextFormField(
                focusNode: _focusNode,
                keyboardType: TextInputType.text,
                autocorrect: false,
                onSaved: (String value) {
                  data.name = value;
                },
                maxLines: 1,
                //initialValue: 'Aseem Wangoo',
                validator: (value) {
                  if (value.isEmpty || value.length < 4) {
                    return 'Nome inválido!';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Fulano',
                    //filled: true,
                    icon: const Icon(Icons.person),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                onSaved: (String value) {
                  data.name = value;
                },
                maxLines: 1,
                //initialValue: 'Aseem Wangoo',
                validator: (value) {
                  if (value.isEmpty || value.length < 4) {
                    return 'Sobrenome inválido!';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Sobrenome',
                    hintText: 'Ciclano...',
                    //filled: true,
                    icon: const Icon(Icons.person),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
            ],
          ),
        )),

    Step(
        title: const Text('E-mail'),
        subtitle: const Text('Nosso meio de contato...'),
        isActive: true,
        state: StepState.indexed,
        // state: StepState.disabled,
        content: Form(
          key: formKeys[2],
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (value) {
                  if (value.isEmpty || !value.contains('@')) {
                    return 'Please enter valid email';
                  }
                },
                onSaved: (String value) {
                  data.email = value;
                },
                maxLines: 1,
                decoration: InputDecoration(
                    labelText: 'Enter your email',
                    hintText: 'Enter a email address',
                    icon: const Icon(Icons.email),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
            ],
          ),
        )),
    Step(
        title: const Text('Senha'),
        // subtitle: const Text('Subtitle'),
        isActive: true,
        state: StepState.indexed,
        content: Form(
          key: formKeys[3],
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                autocorrect: false,
                validator: (value) {
                  if (value.isEmpty || value.length > 2) {
                    return 'Please enter valid age';
                  }
                },
                maxLines: 1,
                onSaved: (String value) {
                  data.age = value;
                },
                decoration: InputDecoration(
                    labelText: 'Enter your age',
                    hintText: 'Enter age',
                    icon: const Icon(Icons.explicit),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
            ],
          ),
        )),

    Step(
        title: const Text('Termos'),
        subtitle: const Text('Subtitle'),
        isActive: true,
        state: StepState.indexed,
        content: Form(
          key: formKeys[4],
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                autocorrect: false,
                validator: (value) {
                  if (value.isEmpty || value.length > 2) {
                    return 'Please enter valid age';
                  }
                },
                maxLines: 1,
                onSaved: (String value) {
                  data.age = value;
                },
                decoration: InputDecoration(
                    labelText: 'Enter your age',
                    hintText: 'Enter age',
                    icon: const Icon(Icons.explicit),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
            ],
          ),
        )),
    //  Step(
    //     title: const Text('Fifth Step'),
    //     subtitle: const Text('Subtitle'),
    //     isActive: true,
    //     state: StepState.complete,
    //     content: const Text('Enjoy Step Fifth'))
  ];

  @override
  Widget build(BuildContext context) {
    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
    }

    void _submitDetails() {
      final FormState formState = _formKey.currentState;

      if (!formState.validate()) {
        showSnackBarMessage('Please enter correct data');
      } else {
        formState.save();
        print("Name: ${data.name}");
        print("Phone: ${data.phone}");
        print("Email: ${data.email}");
        print("Age: ${data.age}");

        showDialog(
            context: context,
            child: AlertDialog(
              title: Text("Details"),
              //content:  Text("Hello World"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("Name : " + data.name),
                    Text("Phone : " + data.phone),
                    Text("Email : " + data.email),
                    Text("Age : " + data.age),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
      }
    }

    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Form(
          key: _formKey,
          child: ListView(children: <Widget>[
            Stepper(
              physics: ClampingScrollPhysics(),
              steps: steps,
              type: StepperType.vertical,
              currentStep: this.currStep,
              onStepContinue: () {
                setState(() {
                  if (formKeys[currStep].currentState.validate()) {
                    if (currStep < steps.length - 1) {
                      currStep = currStep + 1;
                    } else {
                      currStep = 0;
                    }
                  }
                  // else {
                  // Scaffold
                  //     .of(context)
                  //     .showSnackBar( SnackBar(content:  Text('$currStep')));

                  // if (currStep == 1) {
                  //   print('First Step');
                  //   print('object' + FocusScope.of(context).toStringDeep());
                  // }

                  // }
                });
              },
              onStepCancel: () {
                setState(() {
                  if (currStep > 0) {
                    currStep = currStep - 1;
                  } else {
                    currStep = 0;
                  }
                });
              },
              onStepTapped: (step) {
                setState(() {
                  currStep = step;
                });
              },
            ),
            // RaisedButton(
            //   child: Text(
            //     'Save details',
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   onPressed: _submitDetails,
            //   color: Colors.blue,
            // ),
          ]),
        ));
  }
}
