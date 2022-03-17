import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

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
    final pokeService = Provider.of<PokeService>(context, listen: false);

    return FutureBuilder(
        future: pokeService.checkuserpokemones(context),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            //return const Center(child: CircularProgressIndicator());
            return const Text('sin datos');
          } else {
            var items = pokeService.userpokemones;
            return ListView.builder(
              itemCount: items!.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Dismissible(
                  key: Key(item.id),
                  onDismissed: (direction) async {
                    await pokeService.deleteuserpokemones(item.id);
                    setState(() {
                      items.removeAt(index);
                      pokeService.userpokemones = items;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item.name} eliminado'),
                      ),
                    );
                  },
                  background:
                      Container(color: const Color.fromRGBO(213, 0, 0, 1)),
                  child: Wcard(
                      id: item.id,
                      name: item.name,
                      image: item.image,
                      userpokemon: true),
                );
              },
            );
          }
        });
  }
}
