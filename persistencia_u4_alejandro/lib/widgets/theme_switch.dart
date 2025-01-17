import 'package:flutter/material.dart';

// Widget para cambiar el tema de la app
class ThemeSwitch extends StatelessWidget {
  final bool isDarkTheme;
  final Function(bool) toggleTheme;

  ThemeSwitch({required this.isDarkTheme, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Switch(
          value: isDarkTheme,
          onChanged: toggleTheme, // Llamar a la función para cambiar el tema
        ),
        Text('Modo oscuro'),
      ],
    );
  }
}
