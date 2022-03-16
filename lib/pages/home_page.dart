import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

//My imports
import 'package:flutter_application_poke_test/widgets/widget_user_pokemon_list.dart';
import 'package:flutter_application_poke_test/services/poke_services.dart';
import 'package:flutter_application_poke_test/widgets/widget_title.dart';
import 'package:flutter_application_poke_test/widgets/widget_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    Wlist(),
    WUserPokemonList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final pokeService = Provider.of<PokeService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(top: 42),
          child: const Wtitle(title: 'POKE', titleExt: 'TEST'),
        ),
        toolbarHeight: 100,
        elevation: 0,
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 5, right: 20, top: 20),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: const CircleBorder(),
              ),
              child: const Icon(
                Icons.logout,
                size: 35,
              ),
              onPressed: () async {
                final SharedPreferences prefs = await _prefs;
                final success = await prefs.setString('token', 'delete');
                if (success) {
                  pokeService.userpokemones = [];
                  pokeService.pokemones = [];
                  Navigator.pushReplacementNamed(context, 'loading');
                }
              },
            ),
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(
              Icons.home,
              size: 40,
            ),
            tooltip: 'Home',
            label: '.',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
            ),
            activeIcon: Icon(
              Icons.person,
              size: 40,
            ),
            tooltip: 'User',
            label: '.',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
