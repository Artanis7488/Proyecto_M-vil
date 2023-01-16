

import 'package:flutter/material.dart';

import 'Iniciar/Login.dart';

void main () {
  runApp(const Athenec () );
}

class Athenec extends StatelessWidget {
  const Athenec({super.key});

   @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login ()
    );
  }
}


