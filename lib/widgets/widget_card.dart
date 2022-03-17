import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//my imports
import 'package:flutter_application_poke_test/services/poke_services.dart';

class Wcard extends StatefulWidget {
  final String id;
  final String name;
  final String image;
  final bool userpokemon;

  const Wcard(
      {Key? key,
      required this.id,
      required this.name,
      required this.image,
      required this.userpokemon})
      : super(key: key);

  @override
  State<Wcard> createState() => _WcardState();
}

class _WcardState extends State<Wcard> {
  @override
  Widget build(BuildContext context) {
    final pokeService = Provider.of<PokeService>(context);
    return Container(
      margin: const EdgeInsets.only(top: 25, right: 25, left: 25),
      child: Card(
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(widget.name),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeInImage.assetNetwork(
                  placeholder: 'assets/loading.gif',
                  placeholderScale: 7,
                  image: widget.image,
                  imageScale: 0.9,
                ),
              ],
            ),
            widget.userpokemon
                ? Container()
                : ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                          child: const Text('Guardar',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1))),
                          color: const Color.fromRGBO(213, 0, 0, 1),
                          onPressed: () {
                            pokeService.adduserpokemones(context, widget.id);
                          })
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
