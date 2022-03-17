import 'package:flutter/material.dart';

//My imports
import 'package:flutter_application_poke_test/widgets/widget_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                WForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
