import 'dart:convert';
import 'package:http/http.dart' as http;

class Programa {
  final String nombre;
  final bool estado;
  final int id;
  final int id_facultad;

  Programa({required this.nombre, required this.estado, required this.id, required this.id_facultad});

  // Método para convertir JSON a un objeto Programa
  factory Programa.fromJson(Map<String, dynamic> json) {
    return Programa(
      id_facultad: json['id_facultad'],
      nombre: json['nombre'],
      estado: json['estado'],
      id: json['id'],
    );
  }
}

Future<List<Programa>> fetchProgramas() async {
  const url = 'http://157.173.113.225:8081/api/Programas/todosProgramas';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      if (jsonBody['success'] == true) {
        final List<dynamic> data = jsonBody['data'];
        return data.map((item) => Programa.fromJson(item)).toList();
      } else {
        throw Exception("Error: ${jsonBody['message']}");
      }
    } else {
      throw Exception("Error: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to load facultades: $e");
  }
}
