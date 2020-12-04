class PersonaModel {
  PersonaModel({
    this.id,
    this.nombre,
    this.direccion,
    this.telefono,
  });

  int id;
  String nombre;
  String direccion;
  int telefono;

  factory PersonaModel.fromJson(Map<String, dynamic> json) => PersonaModel(
        id: json["id"],
        nombre: json["nombre"],
        direccion: json["direccion"],
        telefono: json["telefono"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "direccion": direccion,
        "telefono": telefono,
      };
}
