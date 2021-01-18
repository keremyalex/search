import 'package:flutter/material.dart';
import 'package:search_app/database/db_manager.dart';
import 'package:search_app/models/persona.dart';

class PersonaPage extends StatefulWidget {
  @override
  _PersonaPageState createState() => _PersonaPageState();
}

class _PersonaPageState extends State<PersonaPage> {
  final DbManager dbmanager = new DbManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Trabajadores',
          style: Theme.of(context).appBarTheme.textTheme.headline5,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('search');
                showSearch(context: context, delegate: PersonaItemsSearch());
              })
        ],
      ),
      // body: Center(
      //     //child: InfoPerson(nombres: _nombres, profesion: _profesion, valoracion: _valoracion),
      //     child: FutureBuilder(
      //         future: dbmanager.getTodasPersonas(),
      //         builder: (context, AsyncSnapshot<List<Persona>> snapshot) {
      //           if (snapshot.hasData) {
      //             final personas = snapshot.data;
      //             //print(personas[0].nombre);
      //             return ListView.builder(
      //                 itemCount: personas.length,
      //                 itemBuilder: (context, i) => Dismissible(
      //                       key: UniqueKey(),
      //                       background: Container(color: Colors.red),
      //                       child: ListTile(
      //                         leading: CircleAvatar(
      //                           backgroundColor: Colors
      //                               .primaries[i % Colors.primaries.length],
      //                           child: Text(
      //                             '${i + 1}',
      //                             style: TextStyle(color: Colors.white),
      //                           ), //${personas[i].id}
      //                         ),
      //                         title: Text(
      //                           personas[i].nombre,
      //                           style: TextStyle(fontWeight: FontWeight.bold),
      //                         ),
      //                         subtitle: Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text('Dirección: ' + personas[i].direccion),
      //                             Text('Teléfono: ' '${personas[i].telefono}'),
      //                             Text('Profesión: ' + personas[i].profesion),
      //                             Text('Turno: ' + personas[i].turno),
      //                             Text('Calificación: '
      //                                 '${personas[i].calificacion}'),
      //                           ],
      //                         ),
      //                         trailing: Padding(
      //                           padding: EdgeInsets.only(top: 10),
      //                           child: Icon(
      //                             Icons.keyboard_arrow_right,
      //                             color: Colors.black,
      //                           ),
      //                         ),
      //                       ),
      //                     ));
      //           } else {
      //             return Text('Hola Future');
      //           }
      //         })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Persona persona = new Persona(
              nombre: 'Miguel Torrez',
              direccion: 'Avenida Norte',
              telefono: 76214852,
              profesion: 'Plomero',
              turno: 'mañana',
              calificacion: 5);
          dbmanager.insertPersona(persona);
          print('Add Persona');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class PersonaItemsSearch extends SearchDelegate<Persona> {
  final DbManager dbmanager = new DbManager();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: dbmanager.getTodasPersonas(),
        builder: (context, AsyncSnapshot<List<Persona>> snapshot) {
          if (snapshot.hasData) {
            final personas = snapshot.data;
            //print(personas[0].nombre);
            var personas1 =
                personas.where((e) => e.nombre.toLowerCase().startsWith(query.toLowerCase())).toList();
            return personas1.isEmpty?Text('No hay resultados..', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),):
            ListView.builder(
                itemCount: personas1.length,
                itemBuilder: (context, i) => Dismissible(
                      key: UniqueKey(),
                      background: Container(color: Colors.red),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Colors.primaries[i % Colors.primaries.length],
                          child: Text(
                            '${i + 1}',
                            style: TextStyle(color: Colors.white),
                          ), //${personas[i].id}
                        ),
                        title: Text(
                          personas1[i].nombre,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Dirección: ' + personas1[i].direccion),
                            Text('Teléfono: ' '${personas1[i].telefono}'),
                            Text('Profesión: ' + personas1[i].profesion),
                            Text('Turno: ' + personas1[i].turno),
                            Text('Calificación: '
                                '${personas1[i].calificacion}'),
                          ],
                        ),
                        trailing: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ));
          } else {
            return Text('Hola Future');
          }
        });
  }
}
