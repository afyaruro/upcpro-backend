import 'package:upcpro_app/Models/pregunta.dart';

class Nivel {
  final int id;
  final int nivel;
  final int dificultad;
  final int competencia;
  final List<Pregunta> preguntas;

  Nivel(
      {required this.nivel,
      required this.competencia,
      required this.preguntas,
      required this.dificultad,
      required this.id});

  factory Nivel.fromJson(Map<String, dynamic> json) {
    return Nivel(
      preguntas: json['preguntas'],
      competencia: json['competencia'],
      nivel: json['nivel'],
      dificultad: json['dificultad'],
      id: json['id'],
    );
  }
}
