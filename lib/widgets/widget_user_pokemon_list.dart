import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//My imports
import 'package:flutter_application_poke_test/services/poke_services.dart';
import 'package:flutter_application_poke_test/widgets/widget_card.dart';

class WUserPokemonList extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  WUserPokemonList({Key? key}) : super(key: key);

  @override
  State<WUserPokemonList> createState() => _WUserPokemonListState();
}

class _WUserPokemonListState extends State<WUserPokemonList> {
  @override
  Widget build(BuildContext context) {
    final pokeService = Provider.of<PokeService>(context);

    return RefreshIndicator(
        child: ListView.builder(
          itemCount: pokeService.userpokemones?.length,
          itemBuilder: (context, index) {
            return Wcard(
                id: pokeService.userpokemones![index].id,
                name: pokeService.userpokemones![index].name,
                image: pokeService.userpokemones![index].image,
                mypokemon: true);
          },
        ),
        onRefresh: () => _refresh(context));
  }

  Future<void> _refresh(BuildContext context) async {
    final pokeService = Provider.of<PokeService>(context, listen: false);
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var userlist = prefs.getStringList('userpokemones');
    if (pokeService.userpokemones!.isEmpty) {
      userlist == null ? userlist = [] : userlist = userlist;
      await pokeService.fetchmypokemon(userlist);
    } else {
      userlist == null ? userlist = [] : userlist = userlist;
      pokeService.userpokemones = [];
      await pokeService.fetchmypokemon(userlist);
    }
    setState(() {});
  }
}
