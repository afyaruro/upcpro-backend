import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:upcpro_app/Models/pregunta.dart';
import 'package:upcpro_app/Service/obtenerPreguntas.dart';
import 'package:upcpro_app/Ui/login.dart';
import 'package:upcpro_app/Ui/menu.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _fadeAnimation;
  // Box? competencia_seleccionadaBox;
  // Box? nivel_actual;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.repeat(reverse: true);

    Future.delayed(const Duration(seconds: 4), () {
      // preguntas();
      // competencia_seleccionadaBox = Hive.box('competencia-seleccionada');
      // nivel_actual = Hive.box('nivel-actua');
      Navigator.pushReplacement(
        context,
        _createFadeTransition(const Login()),
        // _createFadeTransition(const BottomMenu()),


      );
    });
  }

  // preguntas() async {
  //   try {
  //     PreguntaService preguntaService = PreguntaService();

  //     List<Pregunta> preguntas = await preguntaService.fetchPreguntas();
  //     for (var pregunta in preguntas) {
  //       print(
  //           "Pregunta ID: ${pregunta.id}, Encabezado: ${pregunta.encabezado}");
  //     }
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  PageRouteBuilder _createFadeTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: offsetAnimation, child: child),
        );
      },
      transitionDuration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 181, 190, 169),
              Color.fromARGB(255, 133, 167, 137),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: child,
                );
              },
              child: Image.asset(
                "assets/image.png",
                width: 150,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
