
import 'package:athenec/Iniciar/responseLogin_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';

class Profile extends StatefulWidget {
  final ResponseLogin? datos;

  const Profile({super.key, this.datos});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Widget cuerpoProfile(){
    final Size size                       = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: NetworkImage("https://image.freepik.com/vector-gratis/paisaje-montana-bosque-arboles-noche_16058-115.jpg"),
              fit: BoxFit.cover
          )
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.5,
                height: size.height * 0.2,
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: widget.datos?.foto != ""
                      ? MemoryImage(base64Decode(widget.datos!.foto!)) as ImageProvider
                      : const NetworkImage("https://i.pinimg.com/736x/21/20/b0/2120b058cb9946e36306778243eadae5.jpg"),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextFormField(
                  initialValue: widget.datos?.username ?? "no hay datos registrados",
                  decoration: const InputDecoration(
                    hintText: "User",
                    fillColor: Colors.deepPurpleAccent,
                    filled: true, //asigna el color de fondo de fill color, que si este coloreado el fondo
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextFormField(
                  initialValue: widget.datos?.nombres ?? "no hay datos registrados",
                  decoration: const InputDecoration(
                    hintText: "User",
                    fillColor: Colors.deepPurpleAccent,
                    filled: true, //asigna el color de fondo de fill color, que si este coloreado el fondo
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextFormField(
                  initialValue: widget.datos?.apellidos ?? "no hay datos registrados",
                  decoration: const InputDecoration(
                    hintText: "User",
                    fillColor: Colors.deepPurpleAccent,
                    filled: true, //asigna el color de fondo de fill color, que si este coloreado el fondo
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextFormField(
                  initialValue: widget.datos?.correo ?? "no hay datos registrados",
                  decoration: const InputDecoration(
                    hintText: "User",
                    fillColor: Colors.deepPurpleAccent,
                    filled: true, //asigna el color de fondo de fill color, que si este coloreado el fondo
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextFormField(
                  initialValue: widget.datos?.edad ?? "no hay datos registrados",
                  decoration: const InputDecoration(
                    hintText: "User",
                    fillColor: Colors.deepPurpleAccent,
                    filled: true, //asigna el color de fondo de fill color, que si este coloreado el fondo
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextFormField(
                  initialValue: widget.datos?.dni ?? "no hay datos registrados",
                  decoration: const InputDecoration(
                    hintText: "User",
                    fillColor: Colors.deepPurpleAccent,
                    filled: true, //asigna el color de fondo de fill color, que si este coloreado el fondo
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextFormField(
                  initialValue: widget.datos?.direccion ?? "no hay datos registrados",
                  decoration: const InputDecoration(
                    hintText: "User",
                    fillColor: Colors.deepPurpleAccent,
                    filled: true, //asigna el color de fondo de fill color, que si este coloreado el fondo
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Athenec"),
      ),
      body: cuerpoProfile(),
    );
  }
}
