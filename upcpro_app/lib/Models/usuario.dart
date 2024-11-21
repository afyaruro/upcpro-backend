class Usuario {
  String emailUser;
  String passwordUser;
  String tipoUser;
  String imagen;
  String nombres;
  String apellidos;
  String tipoIdentificacion;
  String numeroIdentificacion;
  String sexo;
  DateTime fechaNacimiento;
  int programa;

  // Constructor
  Usuario({
    required this.emailUser,
    required this.passwordUser,
    required this.tipoUser,
    required this.imagen,
    required this.nombres,
    required this.apellidos,
    required this.tipoIdentificacion,
    required this.numeroIdentificacion,
    required this.sexo,
    required this.fechaNacimiento,
    required this.programa,
  });

  // Convierte un objeto Usuario a un mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'emailUser': emailUser,
      'passwordUser': passwordUser,
      'tipoUser': tipoUser,
      'imagen': imagen,
      'nombres': nombres,
      'apellidos': apellidos,
      'tipoIdentificacion': tipoIdentificacion,
      'numeroIdentificacion': numeroIdentificacion,
      'sexo': sexo,
      'fechaNacimiento': fechaNacimiento.toIso8601String(),
      'programa': programa,
    };
  }

  // Convierte un mapa JSON a un objeto Usuario
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      emailUser: json['emailUser'],
      passwordUser: json['passwordUser'],
      tipoUser: json['tipoUser'],
      imagen: json['imagen'],
      nombres: json['nombres'],
      apellidos: json['apellidos'],
      tipoIdentificacion: json['tipoIdentificacion'],
      numeroIdentificacion: json['numeroIdentificacion'],
      sexo: json['sexo'],
      fechaNacimiento: DateTime.parse(json['fechaNacimiento']),
      programa: json['programa'],
    );
  }
}
