import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

//My imports
import 'package:flutter_application_poke_test/services/poke_services.dart';
import 'package:flutter_application_poke_test/pages/login_page.dart';
import 'package:flutter_application_poke_test/pages/home_page.dart';
import 'package:flutter_application_poke_test/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkpokemones(context),
        builder: (context, snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'Cargando...',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                CircularProgressIndicator(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  backgroundColor: Color.fromRGBO(213, 0, 0, 1),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future checkpokemones(BuildContext context) async {
    final pokeService = Provider.of<PokeService>(context);
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    final isdata = await pokeService.fetchpokemon();
    final SharedPreferences prefs = await _prefs;
    if (isdata && prefs.getString('token') == User().tokenD) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (
            _,
            __,
            ___,
          ) =>
              const HomePage(),
          transitionDuration: const Duration(milliseconds: 0),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (
            _,
            __,
            ___,
          ) =>
              const LoginPage(),
          transitionDuration: const Duration(milliseconds: 0),
        ),
      );
    }
  }
}
