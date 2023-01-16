
import 'dart:typed_data';
import 'dart:convert';
import 'package:athenec/Iniciar/register_service.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'alerts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final TextEditingController email = TextEditingController();
  final TextEditingController nombres = TextEditingController();
  final TextEditingController apellidos = TextEditingController();
  final TextEditingController edad = TextEditingController();
  final TextEditingController dni = TextEditingController();
  final TextEditingController direccion = TextEditingController();
  final TextEditingController user = TextEditingController();
  final TextEditingController pass = TextEditingController();

  final _keyForm = GlobalKey<FormState>();

  Widget nombre(){
    return const Text("Sign in",
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
          } if (valor.length < 1 || valor.length > 50){
            return "Nombre no válido";
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

  Widget campoNombre(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        validator: (valor){
          if(valor!.isEmpty){
            return "Campo vacío";
          } if (valor.length < 1 || valor.length > 50){
            return "Nombre no válido";
          }
          return null;
        },
        controller: nombres,
        decoration: const InputDecoration(
          hintText: "Nombre",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  Widget campoApellido(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        validator: (valor){
          if(valor!.isEmpty){
            return "Campo vacío";
          } if (valor.length < 1 || valor.length > 50){
            return "Nombre no válido";
          }
          return null;
        },
        controller: apellidos,
        decoration: const InputDecoration(
          hintText: "Apellido",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  Widget campoEdad(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        validator: (valor){
          if(valor!.isEmpty){
            return "Campo vacío";
          }
          try {
            int valor2 = int.parse(valor ?? "0");
                if(valor2 < 18){
                  return "Menor de edad";
                }
          } catch(ex) {
            return "El valor ingresado no es válido";
          }
          return null;
        },
        controller: edad,
        decoration: const InputDecoration(
          hintText: "Edad",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  Widget campoDNI(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        validator: (valor){
          if(valor!.isEmpty){
            return "Campo vacío";
          }
          try {
            int valor2 = int.parse(valor ?? "0");
          } catch(ex) {
            return "El valor ingresado no es válido";
          } if(valor.length != 8 ){
            return "Número de documento no válido";
          }
          return null;
        },
        controller: dni,
        decoration: const InputDecoration(
          hintText: "DNI",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  Widget campoDireccion(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        validator: (valor){
          if(valor!.isEmpty){
            return "Campo vacío";
          } if (valor.length < 1 || valor.length > 50){
            return "Nombre no válido";
          }
          return null;
        },
        controller: direccion,
        decoration: const InputDecoration(
          hintText: "Direccion",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  Widget campoCorreoE(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        validator: (valor){
          if(valor!.isEmpty){
            return "Campo vacío";
          } if (valor.length < 1 || valor.length > 50){
            return "Nombre no válido";
          }
          return null;
        },
        controller: email,
        decoration: const InputDecoration(
          hintText: "Correo Electrónico",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  Widget campoContrasena(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField( //tiene una propiedad para la contraseña llamada obscureText para ocultar la contraseña
        validator: (valor){
          if(valor!.isEmpty){
            return "Campo vacío";
          } if (valor.length < 1 || valor.length > 50){
            return "Nombre no válido";
          }
          return null;
        },
        controller: pass,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: "Password",
          fillColor: Colors.white,
          filled: true, //asigna el color de fondo de fill color, que si este coloreado el fondo
        ),
      ),
    );
  }

  Widget botonRegister (){
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      ),
      onPressed: ()async{
        String Correo = email.text;
        String nombre = nombres.text;
        String apellido = apellidos.text;
        String edadnum = edad.text;
        String dninum = dni.text;
        String direcc = direccion.text;
        String username = user.text;
        String contrasena = pass.text;

        if(_keyForm.currentState!.validate()){
          RegisterService reg_user = RegisterService();
          bool? responseRegister = await reg_user.register(imageBase64 ?? "", Correo, nombre, apellido, edadnum, dninum, direcc, username, contrasena);
          print(responseRegister);

          if(responseRegister == true){
            Navigator.of(context).pop();
          }
          print("__ Registro Existoso");
        }
      },
      child: const Text("Enter", style: TextStyle(fontSize: 25, color: Colors.white),
      ),
    );
  }

  String? imageBase64;
  bool modImage                       = false;
  final ImagePicker picker            = ImagePicker();
  ImageProvider? image;

  Future<void> _pickImage(bool camera) async {

    final pickedFile = camera
        ? await picker.pickImage(source: ImageSource.camera)
        : await picker.pickImage(source: ImageSource.gallery);

    if(pickedFile != null) {
      modImage = true;
      CroppedFile? cropper = await ImageCropper().cropImage(
          cropStyle: CropStyle.circle,
          sourcePath: pickedFile.path,
          aspectRatioPresets: [CropAspectRatioPreset.square],
          compressQuality: 60,
          maxHeight: 500,
          maxWidth: 500,
          compressFormat: ImageCompressFormat.jpg,
          uiSettings: [
            AndroidUiSettings(
                toolbarColor: Colors.blue,
                toolbarTitle: "Recortar",
                toolbarWidgetColor: Colors.white,
                backgroundColor: Colors.white
            ),
            IOSUiSettings(
                title: "Recortar"
            )
          ]
      );

      Uint8List imgBase64 = await cropper!.readAsBytes();
      imageBase64 = base64Encode(imgBase64);
      setState(() => image = MemoryImage(imgBase64));
    }
  }

  Future editPhoto() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Elija", style: TextStyle(color: Colors.red)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.photo_camera),
                  onPressed: () async {
                    _pickImage(true);
                    Navigator.pop(context);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.photo),
                  onPressed: () async {
                    _pickImage(false);
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size                       = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Athenec"),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: NetworkImage("https://image.freepik.com/vector-gratis/paisaje-montana-bosque-arboles-noche_16058-115.jpg"),
                fit: BoxFit.cover
            )
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _keyForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 25),
                  SizedBox(
                    width: size.width * 0.5,
                    height: size.height * 0.2,
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: modImage
                          ? image
                          : const NetworkImage("https://i.pinimg.com/736x/21/20/b0/2120b058cb9946e36306778243eadae5.jpg"),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        trailing: const Icon(Icons.edit, color: Colors.green),
                        title: const Text("Editar Foto", style: TextStyle(fontSize: 13), textAlign: TextAlign.end),
                        onTap: editPhoto,
                        horizontalTitleGap: 0
                    ),
                  ),
                  nombre(),
                  campoUsuario(),
                  campoNombre(),
                  campoApellido(),
                  campoEdad(),
                  campoDNI(),
                  campoDireccion(),
                  campoCorreoE(),
                  campoContrasena(),
                  const SizedBox(height: 10,),
                  botonRegister(),
                  const SizedBox(height: 30.0,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
