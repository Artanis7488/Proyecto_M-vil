import 'dart:convert';

ResponseLogin responseLoginFromJson(String str) => ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
  String? correo;
  String? nombres;
  String? apellidos;
  String? edad;
  String? dni;
  String? direccion;
  String? foto;
  String? username;
  String? contrasena;

  ResponseLogin(
      {this.correo,
        this.nombres,
        this.apellidos,
        this.edad,
        this.dni,
        this.direccion,
        this.foto,
        this.username,
        this.contrasena});

  ResponseLogin.fromJson(Map<String, dynamic> json) {
    correo = json['correo'];
    nombres = json['nombres'];
    apellidos = json['apellidos'];
    edad = json['edad'];
    dni = json['dni'];
    direccion = json['direccion'];
    foto = json['foto'];
    username = json['username'];
    contrasena = json['contrasena'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['correo'] = this.correo;
    data['nombres'] = this.nombres;
    data['apellidos'] = this.apellidos;
    data['edad'] = this.edad;
    data['dni'] = this.dni;
    data['direccion'] = this.direccion;
    data['foto'] = this.foto;
    data['username'] = this.username;
    data['contrasena'] = this.contrasena;
    return data;
  }
}