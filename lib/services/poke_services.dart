import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:math';

//My imports
import 'package:flutter_application_poke_test/widgets/widget_dialog.dart';
import 'package:flutter_application_poke_test/global/environment.dart';
import 'package:flutter_application_poke_test/models/pokemon.dart';

class PokeService extends ChangeNotifier {
  Pokemon? pokemon;
  late List<Pokemon>? pokemones = [];
  late List<Pokemon>? userpokemones = [];

/*PokeAPi data*/
//The logic is based on making a request based on a random number generator to bring different Pokemon.
//Limited to 10 Pokemon.
  Future fetchpokemon() async {
    for (int i = 0; i < 10; i++) {
      var rng = Random();
      var num = rng.nextInt(255);

      var url = Uri.parse('${Environment.endPointPokemon}/$num');
      final resp = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );
      if (resp.statusCode == 200) {
        pokemon = pokemonFromJson(resp.body, num.toString());
        pokemones?.add(pokemon!);
      }
    }
    if (pokemones != null && pokemones!.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

//The logic is based on passing the list of locally saved IDs to make API requests.
  Future fetchuserpokemon(List<String> mylist) async {
    for (int i = 0; i < mylist.length; i++) {
      var url = Uri.parse('${Environment.endPointPokemon}/${mylist[i]}');
      final resp = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );
      if (resp.statusCode == 200) {
        pokemon = pokemonFromJson(resp.body, mylist[i]);
        userpokemones?.add(pokemon!);
      }
    }
    if (userpokemones != null && userpokemones!.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

/*local storage*/
//The implemented logic is simple.
//The Pokemons ID number is stored locally in a list for later request.
//It is allowed to save 5.
  Future adduserpokemones(BuildContext context, String id) async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var userlist = prefs.getStringList('userpokemones');
    userlist == null ? userlist = [] : userlist = userlist;
    if (userlist.length >= 5) {
      showD(context, 'Upss', 'Lo sentimos ya tienes tus 5 Pokémones.');
    } else {
      userlist.add(id);
      prefs.setStringList('userpokemones', userlist);
      showD(context, '¡Listo!', 'Tienes un nuevo pokémon guardado.');
    }
  }

//Verification of Pokemon saved by the user.
//The users Pokemon list is loaded.
  Future checkuserpokemones(BuildContext context) async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var userlist = prefs.getStringList('userpokemones');
    userlist == null ? userlist = [] : userlist = userlist;
    userpokemones = [];
    final isdata = await fetchuserpokemon(userlist);
    if (isdata) {
      return userpokemones;
    } else {
      return null;
    }
  }

//Remove Pokemon from user list.
  Future deleteuserpokemones(String id) async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var userlist = prefs.getStringList('userpokemones');
    userlist == null ? userlist = [] : userlist = userlist;
    if (userlist.length <= 5) {
      if (userlist.contains(id)) {
        userlist.remove(id);
        prefs.setStringList('userpokemones', userlist);
      } else {
        prefs.setStringList('userpokemones', userlist);
      }
    }
  }
}
