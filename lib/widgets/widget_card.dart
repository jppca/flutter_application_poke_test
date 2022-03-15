import 'package:flutter/material.dart';

class Wcard extends StatefulWidget {
  final String name;
  final String image;
  const Wcard({Key? key, required this.name, required this.image})
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
          ],
        ),
      ),
    );
  }
}
