import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//My imports
import 'package:flutter_application_poke_test/services/poke_services.dart';
import 'package:flutter_application_poke_test/widgets/widget_card.dart';

class Wlist extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Wlist({
    Key? key,
  }) : super(key: key);

  @override
  State<Wlist> createState() => _WlistState();
}

class _WlistState extends State<Wlist> {
  @override
  Widget build(BuildContext context) {
    final pokeService = Provider.of<PokeService>(context, listen: false);
    return RefreshIndicator(
        child: ListView.builder(
          itemCount: pokeService.pokemones?.length,
          itemBuilder: (context, index) {
            return Wcard(
                id: pokeService.pokemones![index].id,
                name: pokeService.pokemones![index].name,
                image: pokeService.pokemones![index].image,
                mypokemon: false);
          },
        ),
        onRefresh: () => _refresh(context));
  }

  Future<void> _refresh(BuildContext context) async {
    final pokeService = Provider.of<PokeService>(context, listen: false);
    if (pokeService.pokemones!.isNotEmpty) {
      pokeService.pokemones = [];
      await pokeService.fetchpokemon(10);
    }
    setState(() {});
  }
}
