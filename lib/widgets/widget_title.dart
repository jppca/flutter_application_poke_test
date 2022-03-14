import 'package:flutter/material.dart';

class Wtitle extends StatelessWidget {
  final String title;
  final String titleExt;

  const Wtitle({Key? key, required this.title, required this.titleExt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 35,
              color: Color.fromRGBO(213, 0, 0, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            titleExt,
            style: const TextStyle(
              fontSize: 35,
              color: Color.fromRGBO(0, 0, 0, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
