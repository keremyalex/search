import 'package:flutter/material.dart';
import 'package:chips_choice/chips_choice.dart';

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
//   String _selectedLocation;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: DropdownButton(
//         hint: Text('Seleccione una opción'),
//         value: _selectedLocation,
//         items: _locations.map((String value) {
//           return new DropdownMenuItem(
//             value: value,
//             child: new Text(value),
//           );
//         }).toList(),
//         onChanged: (value) {
//           setState(() {
//             print(value);
//             _selectedLocation = value;
//           });
//         },
//       )),
//     );
//   }
// }

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // single choice value
  int tag = 1;

  // multiple choice value
  List<String> tags = [];

  // list of string options
  List<String> options = [
    'News',
    'Entertainment',
    'Politics',
    'Automotive',
    'Sports',
    'Education',
    'Fashion',
    'Travel',
    'Food',
    'Tech',
    'Science',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ChipsChoice<String>.multiple(
                choiceStyle: C2ChoiceStyle(
                  //padding: EdgeInsets.symmetric(horizontal: 20),
                  borderColor: Colors.red,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold)
                ),
                value: tags,
                onChanged: (val) => setState(() => tags = val),
                choiceItems: C2Choice.listFrom<String, String>(
                  source: options,
                  value: (i, v) => v,
                  label: (i, v) => v,
                ),
              ),
            ),
          ),
        ),
        RaisedButton(
          onPressed: () {
            print(tags);
          },
          child: Text('Mostrar Datos'),
        )
      ],
    ));
  }
}
