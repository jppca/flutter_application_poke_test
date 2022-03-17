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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 15.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    "assets/io.jpg",
                    isAntiAlias: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
                width: 320.0,
              ),
              const Text(
                'Nombre: User',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Correo: example@email.com',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: pokeService.checkuserpokemones(context),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Text(
                    'Aqui veras a tús pokémones',
                    style: TextStyle(fontSize: 18),
                  ),
                );
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
                            content: Text('${item.name} eliminado.'),
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
            },
          ),
        )
      ],
    );
  }
}
