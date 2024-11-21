import 'package:flutter/material.dart';
import 'package:upcpro_app/Components/customProgresoSign.dart';
import 'package:upcpro_app/Components/textField.dart';
import 'package:upcpro_app/Response/respuestaSign.dart';
import 'package:upcpro_app/Utils/styles.dart';

class Sign1 extends StatefulWidget {
  const Sign1({super.key});

  @override
  State<Sign1> createState() => _Sign1State();
}

class _Sign1State extends State<Sign1> {
  final TextEditingController controllerCorreo = TextEditingController();

  @override
  void dispose() {
    controllerCorreo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 110, 131, 111),
        title: const Text(
          "Paso 1 de 4",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 145, 156, 135),
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
                      porcentaje: fullWidth(context) * 0.24,
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Empecemos a crear tu cuenta",
                        style: TextStyle(
                            fontSize: 35,
                            color: Color.fromARGB(221, 255, 255, 255),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Enviaremos un código a tu correo para verificar que este correo te pertenece",
                        style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(221, 255, 255, 255),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: BuildTextField(
                          hintText: "Correo",
                          icon: Icons.email,
                          controller: controllerCorreo),
                    ),
                    const SizedBox(height: 80),
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
                    String correo = controllerCorreo.text.trim();
                    RespuestaSign.enviarCodigo(correo, context);
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
                    "Siguiente",
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
}
