import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:persistencia_u4_alejandro/widgets/theme_switch.dart';
import 'screens.dart';

/*
Aquesta classe és la pantalla d'inici de sessió, on l'usuari pot introduir les seves dades per accedir a l'aplicació. 
A més, també es pot registrar si no té un compte.
Es la pantalla que apareix quan s'obre l'aplicació.
*/
class LoginScreen extends StatefulWidget {
  final bool isDarkTheme;
  final Function(bool) toggleTheme;

  LoginScreen({required this.isDarkTheme, required this.toggleTheme});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  bool _rememberMe = false; // Variable para recordar al usuario

  // Controladores de texto
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkRememberMeStatus(); // Verificar si "Recordar usuario" está activado
  }

  // Verificar si el "Recordar usuario" está activado
  void _checkRememberMeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? rememberMe = prefs.getBool('rememberMe') ?? false;
    if (rememberMe) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SuccessScreen()),
      );
    }
  }

  void _loginUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (_rememberMe) {
        // Guardar la preferencia de "Recordar usuario"
        prefs.setBool('rememberMe', true);
      } else {
        prefs.setBool('rememberMe', false);
      }

      // Redirigir a la pantalla de éxito
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SuccessScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
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
                controller: _passwordController,
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
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        _rememberMe = value!;
                      });
                    },
                  ),
                  Text('Recordar usuario'),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _loginUser,
                child: Text('Iniciar sesión'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text('No tienes cuenta? Regístrate'),
              ),
              SizedBox(height: 20),
              Center(
                child: ThemeSwitch(
                  isDarkTheme: widget.isDarkTheme,
                  toggleTheme: widget.toggleTheme,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
