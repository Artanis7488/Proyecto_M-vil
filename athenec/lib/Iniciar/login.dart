
import 'package:athenec/Iniciar/perfil.dart';
import 'package:athenec/Iniciar/register.dart';
import 'package:athenec/Iniciar/responseLogin_model.dart';
import 'package:flutter/material.dart';

import 'alerts.dart';
import 'login_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController user = TextEditingController();
  final TextEditingController pass = TextEditingController();

  final _keyForm = GlobalKey<FormState>();

  Widget cuerpoLogin(context){
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: NetworkImage("https://image.freepik.com/vector-gratis/paisaje-montana-bosque-arboles-noche_16058-115.jpg"),
              fit: BoxFit.cover
          )
      ),
      child: Center(
        child: Form(
          key: _keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              nombre(),
              campoUsuario(),
              campoContrasena(),
              const SizedBox(height: 10),
              botonEntrar(),
              const SizedBox(height: 10),
              botonRegistrar(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget nombre(){
    return const Text("Login",
      style: TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold),
    );
  }

  Widget campoUsuario(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        validator: (valor){
          if(valor!.isEmpty){
            return "Campo vacío";
          }
          return null;
        },
        controller: user,
        decoration: const InputDecoration(
          hintText: "User",
          fillColor: Colors.white,
          filled: true, //asigna el color de fondo de fill color, que si este coloreado el fondo
        ),
      ),
    );
  }

  Widget campoContrasena(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        validator: (valor){
          if(valor!.isEmpty){
            return "Campo vacío";
          }
          return null;
        },
        controller: pass,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: "Password",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  Widget botonEntrar (){
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      ),
      onPressed: ()async{
        String username = user.text;
        String contrasena = pass.text;

        if(_keyForm.currentState!.validate()){
          LoginService log_user = LoginService();
          ResponseLogin? responseLogin = await log_user.login(username, contrasena);
          print(responseLogin);

          if(responseLogin != null){
            if (responseLogin.username != null && responseLogin.username != ""){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile(datos: responseLogin,)),
              );
            }
          }

          if(responseLogin == true){
            Navigator.of(context).pop();
          }
          print("__ Sesión iniciada");
        }else{
          GlobalDialog.showError(context, "Error en iniciar sesión", "");
          print("Ha ocurrido un error porfavor vuerlva a llenar los datos");
        }
      },
      child: const Text("Entrar", style: TextStyle(fontSize: 25, color: Colors.white),
      ),
    );
  }

  Widget botonRegistrar (BuildContext context){
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Register()),
        );
      },
      child: const Text("Registrar", style: TextStyle(fontSize: 25, color: Colors.white),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: cuerpoLogin(context),
    );
  }
}
