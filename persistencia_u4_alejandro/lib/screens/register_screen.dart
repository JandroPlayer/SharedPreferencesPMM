import 'package:flutter/material.dart';
import 'login_screen.dart';

/*
Aquesta classe és la pantalla de registre d'usuari on l'usuari pot introduir les seves dades per crear un compte.
Es la pantalla que apareix quan l'usuari clica al botó de "Registrar-se" a la pantalla de login.
*/
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  void _registerUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Aquí iría la lógica de registro del usuario
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen(isDarkTheme: false, toggleTheme: (value) {})),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre de Usuario'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un nombre de usuario';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una contraseña';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registerUser,
                child: Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
