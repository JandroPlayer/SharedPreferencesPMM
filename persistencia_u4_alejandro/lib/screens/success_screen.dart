import 'package:flutter/material.dart';

// Esta es la pantalla de "success" que se muestra cuando el usuario inicia sesión con éxito.
class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
      ),
      body: Center(
        child: Text('¡Has iniciado sesión con éxito!'),
      ),
    );
  }
}
