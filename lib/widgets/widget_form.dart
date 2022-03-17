import 'package:flutter/material.dart';

//My imports
import 'package:flutter_application_poke_test/widgets/widget_custon_input.dart';
import 'package:flutter_application_poke_test/widgets/widget_dialog.dart';
import 'package:flutter_application_poke_test/widgets/widget_title.dart';
import 'package:flutter_application_poke_test/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WForm extends StatefulWidget {
  const WForm({Key? key}) : super(key: key);

  @override
  _WFormState createState() => _WFormState();
}

class _WFormState extends State<WForm> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final emailCtrl = TextEditingController(text: User().emailD);
  final passCtrl = TextEditingController(text: User().passwordD);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(children: <Widget>[
        const Wtitle(title: 'POKE', titleExt: 'TEST'),
        WCustonInput(
            icon: Icons.mail_outline,
            placeholder: "Correo",
            keybordtype: TextInputType.emailAddress,
            textcontroller: emailCtrl),
        WCustonInput(
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
