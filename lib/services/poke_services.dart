import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//My imports
import 'package:flutter_application_poke_test/global/environment.dart';
import 'package:flutter_application_poke_test/models/pokemon.dart';

class PokeService extends ChangeNotifier {
  Pokemon? pokemon;
  late List<Pokemon>? pokemones = [];
  late List<Pokemon>? mypokemones = [];

  Future fetchpokemon(int cp) async {
    for (int i = 0; i < cp; i++) {
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

  Future fetchmypokemon(List<String> mylist) async {
    for (int i = 0; i < mylist.length; i++) {
      var url = Uri.parse('${Environment.endPointPokemon}/${mylist[i]}');
      final resp = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );
      if (resp.statusCode == 200) {
        pokemon = pokemonFromJson(resp.body, mylist[i]);
        mypokemones?.add(pokemon!);
      }
    }
    if (mypokemones != null && mypokemones!.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
