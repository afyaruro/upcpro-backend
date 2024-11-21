import 'dart:math';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class EmailService {
  static String generarCodigoVerificacion() {
    var random = Random();
    return (random.nextInt(900000) + 100000).toString();
  }

  static Future<String> enviarCorreoVerificacion(
      String destinatario, String codigoVerificacion) async {
    final smtpServer =
        gmail("afyarurodeveloment@gmail.com", "vxcg dwdq xcku mlcy");
    const urlLogo = "http://157.173.113.225/uploads/logo/upcpro.png";

    // Crea el mensaje HTML
    String htmlMessage = """
  <!DOCTYPE html>
  <html>
  <head>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
      }
      .container {
        width: 100%;
        padding: 20px;
        background-color: #ffffff;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        margin: 40px auto;
        max-width: 600px;
        border-radius: 8px;
        text-align: center;
      }
      .header {
        background-color: #4caf50;
        color: white;
        padding: 10px;
        font-size: 24px;
        border-radius: 8px 8px 0 0;
      }
      .content {
        padding: 20px;
        font-size: 16px;
      }
      .code {
        font-size: 24px;
        font-weight: bold;
        background-color: #f4f4f4;
        padding: 10px;
        border-radius: 5px;
        color: #4caf50;
        display: inline-block;
        margin: 20px 0;
      }
      .footer {
        margin-top: 20px;
        font-size: 12px;
        color: #888888;
      }
      .img-container {
        width: 150px;
        height: 150px;
        background-color: #A1D0FF;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0 auto 20px;
      }
      .img-container img {
        width: 80%;
        height: auto;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="header">¡Tu Código de Verificación!</div>
      <div class="content">
          <img src="$urlLogo" alt="Logo de la aplicación">
        <p>Hola, gracias por utilizar UpcPro. Tu código de verificación es el siguiente:</p>
        <div class="code">$codigoVerificacion</div>
        <p>Por favor, introduce este código en la aplicación para continuar.</p>
        <p>Si no solicitaste este código, simplemente ignora este mensaje.</p>
      </div>
      <div class="footer">© 2024 UpcPro - Todos los derechos reservados</div>
    </div>
  </body>
  </html>
  """;

    // Crea el mensaje de correo
    final message = Message()
      ..from = const Address("UpcPro@unicesar.edu.co", 'UpcPro')
      ..recipients.add(destinatario)
      ..subject = 'Código de Verificación'
      ..html = htmlMessage;

    try {
      // Enviar el correo
      final sendReport = await send(message, smtpServer);
      print('Mensaje enviado: ' + sendReport.toString());
      return "success";
    } on MailerException catch (e) {
      print('Error al enviar el mensaje: $e');
      for (var p in e.problems) {
        print('Problema: ${p.code}: ${p.msg}');
        return "error";
      }
    }

    return "error";
  }
}
