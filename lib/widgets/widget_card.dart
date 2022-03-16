import 'package:flutter/material.dart';
import 'package:flutter_application_poke_test/widgets/widget_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wcard extends StatefulWidget {
  final String id;
  final String name;
  final String image;
  final bool mypokemon;

  const Wcard(
      {Key? key,
      required this.id,
      required this.name,
      required this.image,
      required this.mypokemon})
      : super(key: key);

  @override
  State<Wcard> createState() => _WcardState();
}

class _WcardState extends State<Wcard> {
  @override
  Widget build(BuildContext context) {
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
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                widget.mypokemon
                    ? MaterialButton(
                        child: const Text('Eliminar',
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1))),
                        color: Colors.black,
                        onPressed: () {
                          deletemypokemones(context, widget.id.toString());
                        })
                    : MaterialButton(
                        child: const Text('Guardar',
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1))),
                        color: const Color.fromRGBO(213, 0, 0, 1),
                        onPressed: () {
                          addmypokemones(context, widget.id.toString());
                        })
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future addmypokemones(BuildContext context, String id) async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var mylist = prefs.getStringList('mypokemones');
    mylist == null ? mylist = [] : mylist = mylist;
    if (mylist.length >= 5) {
      showD(context, 'Upss', 'Lo sentimos ya tienes tus 5 pokemones.');
    } else {
      mylist.add(id);
      prefs.setStringList('mypokemones', mylist);
    }
  }

  Future deletemypokemones(BuildContext context, String id) async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var mylist = prefs.getStringList('mypokemones');
    mylist == null ? mylist = [] : mylist = mylist;
    if (mylist.length <= 5) {
      print(mylist.toString());
      print(id);
      if (mylist.contains(id)) {
        mylist.remove(id);
        prefs.setStringList('mypokemones', mylist);
        showD(context, '¡Listo!', 'Pokémon eliminado con éxito.');
      } else {
        prefs.setStringList('mypokemones', mylist);
      }
    }
  }
}
