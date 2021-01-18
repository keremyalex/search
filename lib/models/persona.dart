

class Persona {
  int id;
  String nombre;
  String direccion;
  int telefono;
  String profesion;
  String turno;
  int calificacion;

  Persona(
      {this.id,
      this.nombre,
      this.direccion,
      this.telefono,
      this.profesion,
      this.turno,
      this.calificacion}
  );

  factory Persona.fromJson(Map<String, dynamic> json) => Persona(
        id: json["id"],
        nombre: json["nombre"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        profesion: json["profesion"],
        turno: json["turno"],
        calificacion: json["calificacion"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "direccion": direccion,
        "telefono": telefono,
        "profesion": profesion,
        "turno": turno,
        "calificacion": calificacion
  };
}
