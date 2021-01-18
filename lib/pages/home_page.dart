import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: ExpansionTile(
                    title: Text('Hola desde Card'),
                    backgroundColor: Colors.white,
                    
                    children: [
                      Text('Contenido del Card1'),
                      Text('Contenido del Card2'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text('Contenido del Card3'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
