import 'package:flutter/material.dart';
import 'package:search_app/database/db_manager.dart';
import 'package:search_app/models/persona.dart';

Color hexColor(String colorhex) {
  String colornew = '0xFF' + colorhex;
  colornew = colornew.replaceAll('#', '');
  int colorint = int.parse(colornew);
  return Color(colorint);
}

final DbManager dbManager = new DbManager();

List<String> nombre = [
  'JAVIER BERMUDEZ TAMAYO',
  'JUAN MANUEL VALVERDE ORTUÑO',
  'DANIEL ORGAZ HIDALGO',
  'ANGELES OCHOA MANZANO',
  'HUGO CARCELES VALERO',
  'MARIA ROSARIO ROJO LEON',
  'ISMAEL BARBER GRANELL',
  'FELIX PINEDO VELAZQUEZ',
  'EVA SENDRA ATIENZA',
  'RAFAEL VALLE GAMIZ',
  'MARIA JOSEFA ALVES MOLL',
  'CRISTOBAL FLOREZ SANTACRUZ',
  'MANUEL BEJARANO ARRIZABALAGA',
  'EMILIA ALBALADEJO MAGRO',
  'RAMON GARCIA MERA',
  'ALVARO GARMENDIA BALAGUER',
  'ALBERTO MONTERO VILLAREJO',
  'JUAN JOSE BENITEZ BAQUERO',
  'DANIEL MONTES PAN',
  'HUGO ESCALANTE OSORIO'
];
List<String> direccion = [
  'Av. Andrés Valladares # 54482',
  'Urb. Pablo Montes # 44153 Dpto. 721',
  'Cl. Irene Prieto # 23894',
  'Jr. Regina Vaca # 35736',
  'Cl. Christopher Espino # 29',
  'Cl. Simón Cornejo # 46 Hab. 933',
  'Cl. Mariangel Castellanos # 5106 Piso 44',
  'Jr. Guadalupe Porras # 2147 Piso 27',
  'Urb. Bautista Carrera # 22',
  'Urb. Ana Sofía Mesa # 0',
  'Urb. Maite Aranda # 22280',
  'Jr. Ximena Ortega # 4 Dpto. 562',
  'Urb. Laura Pacheco # 739',
  'Urb. Abril Bravo # 40 Dpto. 780',
  'Urb. Matthew Benavídez # 542 Hab. 366',
  'Jr. Joaquín Roque # 975 Dpto. 448',
  'Cl. Bruno Roque # 69736 Piso 3',
  'Cl. Esteban Ortiz # 467',
  'Urb. Pedro Huerta # 928',
  'Urb. Agustina Frías # 538'
];
List<int> telefono = [
  62198651,
  89697686,
  76397817,
  79642211,
  76218956,
  72343211,
  86364714,
  64629870,
  68741085,
  85177829,
  82877997,
  81966180,
  61635449,
  67941926,
  84391755,
  85873341,
  82339513,
  77158461,
  64349985,
  72998672
];
List<String> profesion = [
  'Electricista',
  'Albañil',
  'Plomero',
  'Carpintero',
  'Cerrajero',
  'Limpieza',
  'Electricista',
  'Mecanico',
  'Pintor',
  'Cerrajero',
  'Pintor',
  'Jardinero',
  'Plomero',
  'Albañil',
  'Carpintero',
  'Electricista',
  'Mantenimiento',
  'Jardinero',
  'Limpieza',
  'Mecanico'
];
List<String> turno = [
  'mañana',
  'tarde',
  'noche',
  'tarde',
  'mañana',
  'tarde',
  'noche',
  'tarde',
  'mañana',
  'mañana',
  'noche',
  'tarde',
  'tarde',
  'noche',
  'tarde',
  'mañana',
  'tarde',
  'noche',
  'mañana',
  'tarde'
];
List<int> calificacion = [5, 4, 4, 5, 3, 2, 4, 1, 4, 5, 3, 4, 5, 2, 4, 5, 5, 4, 4 ,3];

void agregarDatos() {
  // print('nombre:  ${nombre.length}');
  // print('direccion: ${direccion.length}');
  // print('telefono: ${telefono.length}');
  // print('profesion: ${profesion.length}');
  // print('turno: ${turno.length}');
  // print('calificacion: ${calificacion.length}');
  int tam = nombre.length;
  for (int i = 0; i < tam; i++) {
    Persona persona = new Persona(
        nombre: nombre[i],
        direccion: direccion[i],
        telefono: telefono[i],
        profesion: profesion[i],
        turno: turno[i],
        calificacion: calificacion[i]);
    dbManager.insertPersona(persona);
  }
}
