class Pregunta {
  final String encabezado;
  final String question;
  final String imagenEncabezado;
  final String opcionA;
  final String opcionB;
  final String opcionC;
  final String opcionD;
  final int opcionCorrecta;
  final String retroalimentacion;
  final int id;
  final int tipoCompetencia;
  final int complejidad;
  final int tipoPregunta;

  Pregunta({
    required this.encabezado,
    required this.question,
    required this.imagenEncabezado,
    required this.opcionA,
    required this.opcionB,
    required this.opcionC,
    required this.opcionD,
    required this.opcionCorrecta,
    required this.retroalimentacion,
    required this.tipoCompetencia,
    required this.complejidad,
    required this.tipoPregunta,
    required this.id,
  });

  factory Pregunta.fromJson(Map<String, dynamic> json) {
    return Pregunta(
      encabezado: json['encabezado'] as String,
      question: json['question'] as String,
      imagenEncabezado: json['imagenEncabezado'] as String,
      opcionA: json['opcionA'] as String,
      opcionB: json['opcionB'] as String,
      opcionC: json['opcionC'] as String,
      opcionD: json['opcionD'] as String,
      opcionCorrecta: json['opcionCorrecta'] as int,
      retroalimentacion: json['retroalimentacion'] as String,
      id: json['id'] as int,
      tipoCompetencia: json['preguntaEntity']['tipoCompetencia'] as int,
      complejidad: json['preguntaEntity']['complejidad'] as int,
      tipoPregunta: json['preguntaEntity']['tipoPregunta'] as int,
    );
  }

}
