import 'dart:convert';
import 'package:http/http.dart' as http;

class Facultad {
  final String nombre;
  final bool estado;
  final int id;

  Facultad({required this.nombre, required this.estado, required this.id});

  // Método para convertir JSON a un objeto Facultad
  factory Facultad.fromJson(Map<String, dynamic> json) {
    return Facultad(
      nombre: json['nombre'],
      estado: json['estado'],
      id: json['id'],
    );
  }
}

Future<List<Facultad>> fetchFacultades() async {
  const url = 'http://157.173.113.225:8081/api/Facultad/todasFacultades';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      if (jsonBody['success'] == true) {
        final List<dynamic> data = jsonBody['data'];
        return data.map((item) => Facultad.fromJson(item)).toList();
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
