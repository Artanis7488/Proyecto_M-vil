
import 'dart:convert';
import 'dart:io';
import 'package:athenec/Iniciar/responseLogin_model.dart';
import 'package:http/http.dart';

class LoginService {
  Future<ResponseLogin?> login(String username, String contrasena) async {

    try{
      final Map<String, String?> data = {
        "username": username,
        "contrasena": contrasena,
      };

      final uri = Uri.parse("https://0aec-190-237-55-152.sa.ngrok.io/Jorge/WeatherForecast/Login");

      print(uri);

      final response = await post(uri, headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      }, body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final ResponseLogin responseLoginModel = responseLoginFromJson(utf8.decode(response.bodyBytes));

        print(response.body);

        return responseLoginModel;
      }

      return null;
    }
    catch (e) {
      return null;
    }
  }
}