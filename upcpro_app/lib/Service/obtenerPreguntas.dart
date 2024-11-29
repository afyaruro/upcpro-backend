import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:upcpro_app/Models/pregunta.dart';

class PreguntaService {
  final String baseUrl = "http://157.173.113.225:8081/api";

  Future<List<Pregunta>> fetchPreguntas() async {
    final response = await http.get(Uri.parse("$baseUrl/Pregunta/consultarPreguntas"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      if (data['success'] == true) {
        final List<dynamic> preguntasJson = data['data'];
        return preguntasJson.map((json) => Pregunta.fromJson(json)).toList();
      } else {
        throw Exception("Error: ${data['message']}");
      }
    } else {
      throw Exception("Failed to fetch data. Status Code: ${response.statusCode}");
    }
  }
}
