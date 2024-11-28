import 'package:flutter/material.dart';
import 'package:upcpro_app/Components/header.dart';
import 'package:upcpro_app/Models/nivel.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<Nivel> niveles = List.generate(
      30,
      (index) => Nivel(
        nivel: index + 1,
        dificultad: index + 1,
        id: index + 1,
      ),
    );

    Widget nodoNivel(Nivel nivel, int index) {
      double left = 0;
      double right = 0;
      double top = 0;

      // Altura del patrón para cada ciclo
      const double patternHeight = 510;

      // Ciclo actual
      int cycle = index ~/ 9;

      // Índice dentro del ciclo
      int positionInCycle = index % 9;

      // Desplazamiento vertical basado en el ciclo
      double verticalOffset = cycle * patternHeight;

      // Ajusta las posiciones para acercar más los nodos
      switch (positionInCycle) {
        case 0:
          left = 0;
          top = 20;
          break;
        case 1:
          left = 160;
          top = 60;
          break;
        case 2:
          left = 240;
          top = 150;
          break;
        case 3:
          left = 230;
          top = 240;
          break;
        case 4:
          left = 80;
          top = 280;
          break;
        case 5:
          right = 80;
          top = 270;
          break;
        case 6:
          right = 220;
          top = 330;
          break;
        case 7:
          right = 200;
          top = 400;
          break;
        case 8:
          right = 100;
          top = 470;
          break;
        default:
          break;
      }

      // Aplicar el desplazamiento vertical
      top += verticalOffset;

      return Positioned(
        left: left,
        top: top,
        right: right,
        child: btnNivel(
          nivel: nivel,
        ),
      );
    }

    // Altura total calculada dinámicamente
    const double patternHeight = 510;
    int totalCycles = (niveles.length / 9).ceil();
    double totalHeight = totalCycles * patternHeight;

    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo fija
          Positioned.fill(
            child: Image.asset(
              'assets/fondo.jpg', // Ruta de tu imagen
              fit: BoxFit.cover, // Ajusta la imagen al contenedor
            ),
          ),
          // Contenido desplazable
          Column(
            children: [
              const HeaderHome(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: totalHeight,
                    child: Stack(
                      children: [
                        for (int i = 0; i < niveles.length; i++)
                          nodoNivel(niveles[i], i),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class btnNivel extends StatelessWidget {
  final Nivel nivel;
  const btnNivel({
    super.key,
    required this.nivel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: Stack(
            children: [
              Positioned(
                top: 5,
                child: Container(
                  width: 70,
                  height: 60,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 61, 143, 7),
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),
              Container(
                width: 70,
                height: 60,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 149, 202, 26),
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${nivel.nivel}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          size: 15,
                          color: Color.fromARGB(255, 253, 220, 71),
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          size: 15,
                          color: Color.fromARGB(255, 253, 220, 71),
                        ),
                        Icon(
                          Icons.star_border_purple500_rounded,
                          size: 15,
                          color: Color.fromARGB(255, 253, 220, 71),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
