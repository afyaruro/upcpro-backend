import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:upcpro_app/Alerts/alertCargando.dart';
import 'package:upcpro_app/Alerts/alertError.dart';
import 'package:upcpro_app/Alerts/alertSuccess.dart';
import 'package:upcpro_app/Models/usuario.dart';
import 'package:upcpro_app/Service/enviarCodigo.dart';
import 'package:upcpro_app/Ui/sign2.dart';
import 'package:upcpro_app/Ui/sign3.dart';
import 'package:upcpro_app/Ui/sign4.dart';

//falta verificar que no exista un usuario con el correo

class RespuestaSign {
  static final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static enviarCodigo(String correo, BuildContext context) async {
    correo = correo.trim();
    if (correo.isEmpty) {
      mostrarAlertaError(context, "El correo es requerido.");
      return;
    } else if (!emailRegex.hasMatch(correo)) {
      mostrarAlertaError(context, "Por favor, ingresa un correo válido.");
      return;
    } else if (!correo.endsWith('@unicesar.edu.co')) {
      mostrarAlertaError(
          context, "El correo debe tener el dominio @unicesar.edu.co");
      return;
    } else {
      FocusScope.of(context).unfocus();
      mostrarAlertaCargando(context, 'Cargando...');
      String code = EmailService.generarCodigoVerificacion();
      var resp = await EmailService.enviarCorreoVerificacion(correo, code);

      Navigator.of(context).pop();

      if (resp == "success") {
        FocusScope.of(context).unfocus();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Sign2(
                    code: code,
                    correo: correo,
                  )),
        );
        return;
      } else {
        mostrarAlertaError(context,
            "Ocurrió un error inesperado. No hemos podido enviar el código por email.");
        return;
      }
    }
  }

  static Future<String> reenviarCodigo(
      String correo, BuildContext context) async {
    correo = correo.trim();
    FocusScope.of(context).unfocus();
    mostrarAlertaCargando(context, 'Cargando...');
    String code = EmailService.generarCodigoVerificacion();
    var resp = await EmailService.enviarCorreoVerificacion(correo, code);

    Navigator.of(context).pop();

    if (resp == "success") {
      mostrarAlertaSucces(context, "Codigo reenviado correctamente", () {});
      return code;
    } else {
      mostrarAlertaError(context,
          "Ocurrió un error inesperado. No hemos podido enviar el codigo por email.");
      return "";
    }
  }

  static verificarCodigo(
      {required String code,
      required String codeEscrito,
      required String correo,
      required BuildContext context}) {
    if (code == codeEscrito) {
      correo = correo.trim();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Sign3(correo: correo)),
      );
      return;
    }

    mostrarAlertaError(context, "Código incorrecto.");
    return;
  }

  static bool isPasswordSecure(String password) {
    if (password.length < 8) return false;

    if (!RegExp(r'[A-Z]').hasMatch(password)) return false;

    if (!RegExp(r'[a-z]').hasMatch(password)) return false;

    if (!RegExp(r'[0-9]').hasMatch(password)) return false;

    return true;
  }

  static ValidateData(
      {required String correo,
      required String nombre,
      required String apellido,
      required String tipoIdentificacion,
      required String identificacion,
      required String genero,
      required String fechacNacimiento,
      required int programa,
      required BuildContext context}) {
    if (nombre.isEmpty) {
      mostrarAlertaError(context, "El nombre es requerido");
      return;
    }

    if (apellido.isEmpty) {
      mostrarAlertaError(context, "El apellido es requerido");
      return;
    }

    if (tipoIdentificacion == "Tipo de identificación") {
      mostrarAlertaError(context, "El tipo de Identificación es requerido");
      return;
    }

    if (identificacion.isEmpty) {
      mostrarAlertaError(context, "El número de identificación es requerido");
      return;
    }
    if (genero == "Género") {
      mostrarAlertaError(context, "El género es requerido");
      return;
    }

    if (fechacNacimiento.isEmpty) {
      mostrarAlertaError(context, "La fecha de nacimiento es requerida");
      return;
    }

    if (programa == 0) {
      mostrarAlertaError(context, "El programa es requerido");
      return;
    }

    DateFormat formato = DateFormat("dd/MM/yyyy");

    // Convierte el string a DateTime
    DateTime fecha = formato.parse(fechacNacimiento);

    Usuario user = new Usuario(
        emailUser: correo,
        passwordUser: "",
        tipoUser: "estudiante",
        imagen: "",
        nombres: nombre,
        apellidos: apellido,
        tipoIdentificacion: tipoIdentificacion,
        numeroIdentificacion: identificacion,
        sexo: genero,
        fechaNacimiento: fecha,
        programa: programa);

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Sign4(
                user: user,
              )),
    );
  }
}
