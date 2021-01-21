import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

mostrarAlert(BuildContext context, String titulo, String subtitulo) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(titulo),
      content: Text(subtitulo),
      actions: <Widget>[
        MaterialButton(
          child: Text('Ok'),
          elevation: 5,
          color: Colors.orangeAccent[700],
          onPressed: () => Navigator.pop(context),
        )
      ],
    ),
  );
}
