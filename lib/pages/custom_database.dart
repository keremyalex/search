import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CustomDatabase extends StatefulWidget {
  @override
  _CustomDatabaseState createState() => _CustomDatabaseState();
}

class _CustomDatabaseState extends State<CustomDatabase> {
  final DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              leerDatos();
            },
            child: Text('Leer Datos'),
          ),
          RaisedButton(
            onPressed: () {
              addDatos();
            },
            child: Text('Ingresar Datos'),
          ),
          RaisedButton(
            onPressed: () {
              removeDatos(1);
            },
            child: Text('Borrar Datos'),
          ),
        ],
      )),
    );
  }

  void leerDatos() {
    // databaseReference.once().then((snapshot) {
    //   print(snapshot.value[1]);
    // });


    // var dato = databaseReference.orderByChild('id').equalTo('ID2');
    // dato.once().then((snapshot) {
    //   print(snapshot.value);
    // });

    var dato = databaseReference.orderByChild('profesion').equalTo('Ingeniero');
    dato.once().then((snapshot) {
      print(snapshot.value);
    });
  }

  void addDatos() {
    // databaseReference
    //     .child('2')
    //     .set({'id': 'ID2', 'data': 'Esto es otro ejemplo'});
    databaseReference
        .child('6')
        .set({
          'id': 'ID6', 
          'nombre': 'Junior', 
          'profesion': 'Ingeniero', 
          'horario': ['mañana', 'tarde']
          });
  }

  void removeDatos(int id) {
    databaseReference.child('$id').remove();
  }
}
