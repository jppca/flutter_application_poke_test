import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

showD(BuildContext context, String title, String subtitle) {
  if (Platform.isAndroid) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Text(subtitle),
              actions: <Widget>[
                MaterialButton(
                    child: const Text('Ok',
                        style:
                            TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
                    color: const Color.fromRGBO(213, 0, 0, 1),
                    onPressed: () => Navigator.pop(context))
              ],
            ));
  }
  showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(subtitle),
              actions: <Widget>[
                CupertinoDialogAction(
                    child: const Text('Ok',
                        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1))),
                    onPressed: () => Navigator.pop(context))
              ]));
}
