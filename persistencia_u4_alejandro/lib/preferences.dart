import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _instancia;

  // Método para inicializar SharedPreferences
  static Future init() async {
    _instancia = await SharedPreferences.getInstance();
  }

  // Getter para obtener el valor de 'estat'
  static bool get estat {
    return _instancia.getBool('estat') ?? false; // Retorna false si 'estat' no está guardado
  }

  // Setter para establecer el valor de 'estat'
  static set estat(bool value) {
    _instancia.setBool('estat', value); // Guarda el valor de 'estat'
  }
}

