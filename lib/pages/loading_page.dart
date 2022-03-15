import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//My imports
import 'package:flutter_application_poke_test/pages/login_page.dart';
import 'package:flutter_application_poke_test/services/poke_services.dart';

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
        //future: ,
        builder: (context, snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'Espere...',
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

    final isdata = await pokeService.fetchpokemon(10);
    if (isdata) {
      /*  sockectService.connect();
      //Navigator.pushReplacementNamed(context, '');
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (
            _,
            __,
            ___,
          ) =>
              const UsersPages(),
          transitionDuration: const Duration(milliseconds: 0),
        ),
      );
    } else {*/
      //Navigator.pushReplacementNamed(context, 'login');
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
