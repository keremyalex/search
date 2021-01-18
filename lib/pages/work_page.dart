import 'package:flutter/material.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';

class WorkPage extends StatefulWidget {
  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  List<String> _nombres = [
    'Alex Paco Crispin',
    'Carlos',
    'Raúl',
    'Miguel',
    'Fernando',
    'Felipe',
    'Alejandro'
  ];
  List<String> _profesion = [
    'Mecánico',
    'Jardinero',
    'Electricista',
    'Plomero',
    'Albañil',
    'Músico',
    'Cocinero'
  ];

  List<double> _valoracion = [5, 4, 3, 4, 2, 1, 3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Trabajadores',
          style: Theme.of(context).appBarTheme.textTheme.headline5,
        ),
      ),
      body: Center(
        //child: InfoPerson(nombres: _nombres, profesion: _profesion, valoracion: _valoracion),
        child: ListView.builder(
          itemCount: _nombres.length,
          itemBuilder: (_, int i) => InfoPerson(nombre: _nombres[i], profesion: _profesion[i], valoracion: _valoracion[i]),
        ),
      )
    );
  }
}

class InfoPerson extends StatelessWidget {
  const InfoPerson({
    Key key,
    @required String nombre,
    @required String profesion,
    @required double valoracion,
  }) : _nombre = nombre, _profesion = profesion, _valoracion = valoracion, super(key: key);

  final String _nombre;
  final String _profesion;
  final double _valoracion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 50,
                  ),
                  Text(_nombre, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
                ],
              ),
              Text(_profesion, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              Text('Lunes a Viernes: 7:00 - 16:00', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              Container(
                alignment: Alignment.center,
                child: RatingBar(
                  rating: _valoracion,
                  icon: Icon(
                    Icons.star,
                    size: 40,
                    color: Colors.blue,
                  ),
                  starCount: 5,
                  spacing: 5.0,
                  size: 30,
                  isIndicator: false,
                  allowHalfRating: true,
                  onRatingCallback:
                      (double value, ValueNotifier<bool> isIndicator) {
                    print('Number of stars-->  $value');
                    //change the isIndicator from false  to true ,the       RatingBar cannot support touch event;
                    isIndicator.value = true;
                  },
                  color: Colors.amber,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
