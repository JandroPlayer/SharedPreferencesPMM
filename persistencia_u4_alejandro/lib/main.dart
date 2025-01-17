import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Punto de entrada de la aplicación
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkTheme = false; // Variable para el tema oscuro

  @override
  void initState() {
    super.initState();
    _loadThemePreferences(); // Cargar la preferencia del tema cuando inicie la app
  }

  // Cargar las preferencias del tema
  void _loadThemePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDarkTheme = prefs.getBool('isDarkTheme') ?? false; // Cargar la preferencia del tema
    setState(() {
      _isDarkTheme = isDarkTheme;
    });
  }

  // Cambiar el tema y guardar la preferencia en SharedPreferences
  void _toggleTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', value);

    setState(() {
      _isDarkTheme = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // Tema claro por defecto
      darkTheme: ThemeData.dark(), // Tema oscuro
      themeMode: _isDarkTheme ? ThemeMode.dark : ThemeMode.light, // Cambiar entre temas según la preferencia
      home: LoginScreen(
        isDarkTheme: _isDarkTheme,
        toggleTheme: _toggleTheme,
      ),
    );
  }
}
