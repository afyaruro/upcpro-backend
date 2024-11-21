import 'dart:async';
import 'package:flutter/material.dart';
import 'package:upcpro_app/Components/customProgresoSign.dart';
import 'package:upcpro_app/Components/textField.dart';
import 'package:upcpro_app/Response/respuestaSign.dart';
import 'package:upcpro_app/Utils/styles.dart';

class Sign2 extends StatefulWidget {
  late String code;
  final String correo;
  Sign2({super.key, required this.code, required this.correo});

  @override
  State<Sign2> createState() => _Sign2State();
}

class _Sign2State extends State<Sign2> {
  final TextEditingController codeController = TextEditingController();
  Timer? _timer;
  int _start = 60;

  void _startTimer() {
    setState(() {
      _start = 60;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_start > 0) {
          _start--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void _resendCode() async {
    String newCode = await RespuestaSign.reenviarCodigo(widget.correo, context);
    widget.code = newCode.isNotEmpty ? newCode : widget.code;
    _startTimer();
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    codeController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 110, 131, 111),
        title: const Text(
          "Paso 2 de 4",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 145, 156, 135),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProgresoSign(porcentaje: fullWidth(context) * 0.48),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Confirma el código",
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
                        "Hemos enviado un código a tu correo.",
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
                          hintText: "Código de verificación",
                          icon: Icons.comment_outlined,
                          controller: codeController),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: _start == 0 ? _resendCode : null,
                        child: Text(
                          _start == 0
                              ? "Reenviar código"
                              : "Reenviar código en $_start s",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
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
                    RespuestaSign.verificarCodigo(
                        code: widget.code,
                        codeEscrito: codeController.text.trim(),
                        correo: widget.correo,
                        context: context);
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
