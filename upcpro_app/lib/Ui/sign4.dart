import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:upcpro_app/Alerts/alertError.dart';
import 'package:upcpro_app/Alerts/alertSuccess.dart';
import 'package:upcpro_app/Components/customProgresoSign.dart';
import 'package:upcpro_app/Components/textField.dart';
import 'package:upcpro_app/Models/usuario.dart';
import 'package:upcpro_app/Response/respuestaSign.dart';
import 'package:upcpro_app/Utils/styles.dart';

class Sign4 extends StatefulWidget {
  final Usuario user;
  const Sign4({super.key, required this.user});

  @override
  State<Sign4> createState() => _Sign4State();
}

class _Sign4State extends State<Sign4> {
  final TextEditingController controllerPass = TextEditingController();
  final TextEditingController controllerConfPass = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 110, 131, 111),
        title: const Text(
          "Paso 4 de 4",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 145, 156, 135),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProgresoSign(
                      porcentaje: fullWidth(context) * 0.95,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: const Text(
                          "Seguridad",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 35,
                              color: Color.fromARGB(221, 255, 255, 255),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Crea una contraseña segura para tu cuenta",
                        style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(221, 255, 255, 255),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: BuildTextField(
                          hintText: "Contraseña Nueva",
                          icon: Icons.key,
                          controller: controllerPass,
                          isPassword: true),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: BuildTextField(
                          controller: controllerConfPass,
                          hintText: "Confirma tu Contraseña",
                          icon: Icons.key,
                          isPassword: true),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (controllerPass.text.isEmpty) {
                      mostrarAlertaError(
                          context, "La nueva contraseña es requerida");
                      return;
                    }

                    if (!RespuestaSign.isPasswordSecure(controllerPass.text)) {
                      mostrarAlertaError(context, "La contraseña no es segura");
                      return;
                    }

                    if (controllerPass.text != controllerConfPass.text) {
                      mostrarAlertaError(
                          context, "Las contraseñas no coinciden");
                      return;
                    }

                    widget.user.passwordUser = controllerPass.text;

                    //aca crear la cuenta

                    crearCuenta(context);

                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Crear Cuenta",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff689734),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> crearCuenta(BuildContext context) async {
    final url = Uri.parse('http://157.173.113.225:8081/api/Estudiante/crearCuenta');
    final body = {
      "emailUser": widget.user.emailUser,
      "passwordUser": controllerPass.text,
      "tipoUser": widget.user.tipoUser,
      "imagen": " ",
      "nombres": widget.user.nombres,
      "apellidos": widget.user.apellidos,
      "tipoIdentificacion": widget.user.tipoIdentificacion,
      "numeroIdentificacion": widget.user.numeroIdentificacion,
      "sexo": widget.user.sexo,
      "fechaNacimiento": "2024-11-21T15:14:40.360Z",
      "programa": widget.user.programa
    };

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        mostrarAlertaSucces(context, "Succes: ${response.body}", (){});
      } else {
        mostrarAlertaError(context, "Error: ${response.body}");
      }
    } catch (e) {
      mostrarAlertaError(context, "Error de red: $e");
    }
  }
}
