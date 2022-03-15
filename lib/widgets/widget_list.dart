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
    final pokeService = Provider.of<PokeService>(context);
    return ListView.builder(
      itemCount: pokeService.pokemones?.length,
      itemBuilder: (context, index) {
        return Wcard(
            name: pokeService.pokemones![index].name,
            image: pokeService.pokemones![index].image);
      },
    );
  }
}
