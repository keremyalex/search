import 'package:flutter/material.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';

class InfoPerson extends StatelessWidget {
  const InfoPerson({
    Key key,
    @required String nombre,
    @required String direccion,
    @required int telefono,
    @required String profesion,
    @required String turno,
    @required int valoracion,
  })  : _nombre = nombre,
        _direccion = direccion,
        _telefono = telefono,
        _profesion = profesion,
        _turno = turno,
        _valoracion = valoracion,
        super(key: key);

  final String _nombre;
  final String _direccion;
  final int _telefono;
  final String _profesion;
  final String _turno;
  final int _valoracion;

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
                  Text(
                    _nombre,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Text(
                _profesion,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                'Lunes a Viernes: 7:00 - 16:00',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Container(
                alignment: Alignment.center,
                child: RatingBar(
                  rating: _valoracion.toDouble(),
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
