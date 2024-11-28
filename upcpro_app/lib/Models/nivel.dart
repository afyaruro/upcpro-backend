

class Nivel {
  final int id;
  final int nivel;
  final int dificultad;

  Nivel({required this.nivel, required this.dificultad,  required this.id});

  factory Nivel.fromJson(Map<String, dynamic> json) {
    return Nivel(
      nivel: json['nivel'],
      dificultad: json['dificultad'],
      id: json['id'],
    );
  }
}

