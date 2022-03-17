import 'package:flutter/material.dart';

//my imports
import 'package:flutter_application_poke_test/widgets/widget_custom_input.dart';
import 'package:flutter_application_poke_test/widgets/widget_dialog.dart';
import 'package:flutter_application_poke_test/widgets/widget_title.dart';
import 'package:flutter_application_poke_test/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                Form(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Form extends StatefulWidget {
  const Form({Key? key}) : super(key: key);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final emailCtrl = TextEditingController(text: User().emailD);
  final passCtrl = TextEditingController(text: User().passwordD);

  @override
  Widget build(BuildContext context) {
    //final pokeService = Provider.of<PokeService>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(children: <Widget>[
        const Wtitle(title: 'POKE', titleExt: 'TEST'),
        WCustomInput(
            icon: Icons.mail_outline,
            placeholder: "Correo",
            keybordtype: TextInputType.emailAddress,
            textcontroller: emailCtrl),
        WCustomInput(
          icon: Icons.lock_outline,
          placeholder: "Contraseña",
          keybordtype: TextInputType.visiblePassword,
          textcontroller: passCtrl,
          ispassword: true,
        ),
        Center(
          child: ElevatedButton(
            child: const SizedBox(
              width: 200,
              height: 50,
              child: Center(
                child: Text(
                  'Ingresar',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1), fontSize: 17),
                ),
              ),
            ),
            onPressed: () async {
              if (emailCtrl.text != User.email) {
                showD(context, 'Dato incorrecto',
                    'Ingrese el correo correcto \n"example@email.com"');
              } else {
                if (passCtrl.text != User.password) {
                  showD(context, 'Dato incorrecto',
                      'Ingrese la contraseña correcta \n"example"');
                } else {
                  final SharedPreferences prefs = await _prefs;
                  prefs.setString('token', User().tokenD);
                  Navigator.pushReplacementNamed(context, 'home');
                }
              }
            },
          ),
        ),
      ]),
    );
  }
}
