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
          itemCount: pokeService.mypokemones?.length,
          itemBuilder: (context, index) {
            return Wcard(
                id: pokeService.mypokemones![index].id,
                name: pokeService.mypokemones![index].name,
                image: pokeService.mypokemones![index].image,
                mypokemon: true);
          },
        ),
        onRefresh: () => _refresh(context));
  }

  Future<void> _refresh(BuildContext context) async {
    final pokeService = Provider.of<PokeService>(context, listen: false);
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var mylist = prefs.getStringList('mypokemones');
    if (pokeService.mypokemones!.isEmpty) {
      mylist == null ? mylist = [] : mylist = mylist;
      await pokeService.fetchmypokemon(mylist);
    } else {
      mylist == null ? mylist = [] : mylist = mylist;
      pokeService.mypokemones = [];
      await pokeService.fetchmypokemon(mylist);
    }
    setState(() {});
  }
}
