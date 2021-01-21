import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:search_app/constant.dart';
import 'package:search_app/database/db_manager.dart';
import 'package:search_app/models/persona.dart';
import 'package:search_app/theme.dart';

class FiltroPage extends StatefulWidget {
  @override
  _FiltroPageState createState() => _FiltroPageState();
}

class _FiltroPageState extends State<FiltroPage> {
  final DbManager dbmanager = new DbManager();

  int tag = 0;
  int tag1 = 0;
  int tag2 = 0;
  List<Persona> personas = [];
  final mySeachController = TextEditingController();

  getAll() {
    dbmanager.getTodasPersonas().then((value) {
      setState(() {
        personas = value;
      });
    });
  }

  getFiltroProfesion(String prof) {
    dbmanager.getFiltroProfesion(prof).then((value) {
      setState(() {
        personas = value;
      });
    });
  }

  getFiltro(String prof, int calif, String turn) {
    dbmanager.getFiltro(prof, calif, turn).then((value) {
      setState(() {
        personas = value;
      });
    });
  }

  List<String> profesiones = [];
  List<String> estrellas = ['1', '2', '3', '4', '5'];
  List<String> turno = ['mañana', 'tarde', 'noche'];

  mostrarAlerta(BuildContext context, String titulo, String subtitulo,
      List<Persona> per) {
    // single choice value

    List<Persona> personasTemp = per;

    personasTemp.forEach((e) {
      if (!profesiones.contains(e.profesion)) {
        profesiones.add(e.profesion);
      }
    });

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            insetPadding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
            title: Text(titulo),
            //content: Text(subtitulo),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Profesión:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ChipsChoice<int>.single(
                  choiceStyle: C2ChoiceStyle(
                      //padding: EdgeInsets.symmetric(horizontal: 20),
                      borderColor: Colors.red,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  value: tag,
                  onChanged: (val) => setState(() => tag = val),
                  choiceItems: C2Choice.listFrom<int, String>(
                    source: profesiones,
                    value: (i, v) => i,
                    label: (i, v) => v,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Calificación:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ChipsChoice<int>.single(
                  choiceStyle: C2ChoiceStyle(
                      //padding: EdgeInsets.symmetric(horizontal: 20),
                      borderColor: Colors.red,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  value: tag1,
                  onChanged: (val) => setState(() => tag1 = val),
                  choiceItems: C2Choice.listFrom<int, String>(
                    source: estrellas,
                    value: (i, v) => i,
                    label: (i, v) => v,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Turno:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ChipsChoice<int>.single(
                  choiceStyle: C2ChoiceStyle(
                      //padding: EdgeInsets.symmetric(horizontal: 20),
                      borderColor: Colors.red,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  value: tag2,
                  onChanged: (val) => setState(() => tag2 = val),
                  choiceItems: C2Choice.listFrom<int, String>(
                    source: turno,
                    value: (i, v) => i,
                    label: (i, v) => v,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              MaterialButton(
                  child: Text('Cancelar'),
                  elevation: 5,
                  color: Colors.orangeAccent[700],
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.pop(context);
                  }),
              MaterialButton(
                  child: Text('Ok'),
                  elevation: 5,
                  color: Colors.orangeAccent[700],
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    print(profesiones[tag]);
                    print(estrellas[tag1]);
                    print(turno[tag2]);
                    //getFiltroProfesion(profesiones[tag]);
                    getFiltro(profesiones[tag], int.parse(estrellas[tag1]),
                        turno[tag2]);
                    Navigator.pop(context);
                  })
            ],
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getAll();
    //print(listPerson[0].nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Trabajadores',
          style: Theme.of(context).appBarTheme.textTheme.headline5,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: mySeachController,
                      decoration: InputDecoration(
                          hintText: 'Buscar servicios..',
                          suffixIcon: IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                print('iconb');
                                // print(mySeachController.text);
                                FocusScope.of(context).unfocus();
                                if (mySeachController.text == '') {
                                  getAll();
                                } else {
                                  getFiltroProfesion(mySeachController.text.trim());
                                }
                              })),
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.filter_list,
                      //color: Colors.blue[800],
                      color: theme().primaryColor,
                    ),
                    onPressed: () {
                      getAll();
                      mostrarAlerta(
                          context, 'Búsqueda:', 'Elegir datos', personas);
                      //getAll();
                    })
              ],
            ),
            Flexible(
              child: (personas.length == 0)
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'No hay resultados..',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: personas.length,
                      itemBuilder: (context, i) => Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: hexColor('#bbbfc4').withOpacity(0.6),
                                borderRadius: BorderRadius.circular(25),

                                // boxShadow: [
                                //   BoxShadow(
                                //     color: hexColor('#d1cbad'),
                                //     offset: Offset(1, 1),
                                //     blurRadius: 5
                                //   )
                                // ]
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors
                                      .primaries[i % Colors.primaries.length],
                                  child: Text(
                                    '${i + 1}',
                                    style: TextStyle(color: Colors.white),
                                  ), //${personas[i].id}
                                ),
                                title: Text(
                                  personas[i].nombre,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Dirección: ' + personas[i].direccion),
                                    Text('Teléfono: '
                                        '${personas[i].telefono}'),
                                    Text('Profesión: ' + personas[i].profesion),
                                    Text('Turno: ' + personas[i].turno),
                                    Text('Calificación: '
                                        '${personas[i].calificacion}'),
                                    buildEstrellas(personas[i].calificacion)
                                  ],
                                ),
                              ),
                            ),
                          )),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme().primaryColor,
        onPressed: () {
          print('FAB');
          agregarDatos();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildEstrellas(int value) {
    return Row(
        children: List.generate(5, (index) {
      return index < value ? Icon(Icons.star, color: Colors.amber,) : Icon(Icons.star_border);
    }));
  }
}
