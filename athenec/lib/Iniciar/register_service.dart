import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

class RegisterService {
  Future<bool?> register(String foto, String Correo, String nombres, String apellidos, String edad, String dni, String direccion, String username, String contrasena) async {

    try{
      final Map<String, String?> data = {
        "Correo": Correo,
        "nombres": nombres,
        "apellidos": apellidos,
        "edad": edad,
        "dni": dni,
        "direccion": direccion,
        "foto": foto,
        "username": username,
        "contrasena": contrasena ,
      };

      final uri = Uri.parse("https://0aec-190-237-55-152.sa.ngrok.io/Jorge/WeatherForecast/Register");
      print(uri);

      final response = await post(uri, headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      }, body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final bool responseRegister = response.body == "true";
        print(response.body);

        return responseRegister;
      }
      return null;
    }
    catch (e) {
      return null;
    }
  }
}