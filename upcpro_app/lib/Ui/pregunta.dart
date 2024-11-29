import 'package:flutter/material.dart';
import 'package:upcpro_app/Models/pregunta.dart';
import 'package:upcpro_app/Ui/menu.dart';
import 'package:upcpro_app/Ui/resultado.dart';

class PreguntaBasica extends StatefulWidget {
  final List<Pregunta> preguntas;
  final int index;
  final int preguntasCorrectas;
  const PreguntaBasica(
      {super.key,
      required this.preguntas,
      required this.index,
      this.preguntasCorrectas = 0});

  @override
  State<PreguntaBasica> createState() => _PreguntaBasicaState();
}

class _PreguntaBasicaState extends State<PreguntaBasica> {
  int? selectedOption;
  bool comprobar = false;

  void selectOption(int index) {
    setState(() {
      selectedOption = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pregunta = widget.preguntas[widget.index];
    final List<String> options = [
      pregunta.opcionA,
      pregunta.opcionB,
      pregunta.opcionC,
      pregunta.opcionD
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 252, 245),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 25,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                // color: Colors.amber,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.2), // Color de la sombra con opacidad
                      blurRadius: 4, // Difuminado de la sombra
                      offset: const Offset(0, 2), // Desplazamiento de la sombra
                    ),
                  ],
                ),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomMenu()));
                      },
                      icon: Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 192, 192, 192),
                        size: MediaQuery.of(context).size.width * 0.1,
                      ),
                    ),
                    Image.asset(
                      './assets/upcpro.png',
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      height: 15,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 235, 183, 245),
                        borderRadius: BorderRadius.circular(
                            10), // Radio de los bordes redondeados
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: widget.index == 0
                              ? MediaQuery.of(context).size.width * 0.5 * 0.3
                              : widget.index == 1
                                  ? MediaQuery.of(context).size.width *
                                      0.5 *
                                      0.6
                                  : MediaQuery.of(context).size.width *
                                      0.5 *
                                      0.9,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 151, 57, 180),
                            borderRadius: BorderRadius.circular(
                                10), // Radio de los bordes redondeados
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // pregunta de aca en adelante
              const SizedBox(
                height: 30,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    pregunta.question,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    for (var i = 0; i < options.length; i++)
                      GestureDetector(
                        onTap: selectedOption == null || !comprobar
                            ? () => selectOption(i)
                            : null, // Bloquea la acción si las condiciones no se cumplen
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: selectedOption == i
                                ? Color.fromARGB(87, 188, 93, 218)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: selectedOption == i
                                  ? Color.fromARGB(255, 151, 57, 180)
                                  : Colors.grey[300]!,
                              width: 2,
                            ),
                            boxShadow: selectedOption == i
                                ? [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 151, 57, 180)
                                          .withOpacity(0.3),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                      offset: const Offset(0, 4),
                                    )
                                  ]
                                : [],
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: selectedOption == i
                                    ? Color.fromARGB(255, 151, 57, 180)
                                    : Colors.grey[300],
                                child: Text(
                                  String.fromCharCode(65 + i), // A, B, C, D
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  options[i],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: selectedOption == i
                                        ? Color.fromARGB(255, 151, 57, 180)
                                        : Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Visibility(
                visible: comprobar, // Controlar visibilidad con la variable
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                      child: Text(
                    selectedOption == null
                        ? "Selecciona una opción"
                        : comprobar
                            ? selectedOption != null &&
                                    selectedOption ==
                                        pregunta.opcionCorrecta - 1
                                ? "¡Correcto! ${pregunta.retroalimentacion}"
                                : "¡Incorrecta! ${pregunta.retroalimentacion}"
                            : "",
                    style: TextStyle(
                        color: selectedOption != null &&
                                selectedOption == pregunta.opcionCorrecta - 1
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  )),
                ),
                // replacement: const Text(
                //     "El widget está oculto"), // Mostrar otro widget si está oculto
              ),

              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedOption == null && comprobar) {
                        return;
                      }

                      if (!comprobar) {
                        comprobar = true;

                        setState(() {});
                        return;
                      }

                      int IsCorrecta =
                          selectedOption == pregunta.opcionCorrecta - 1 ? 1 : 0;

                      int correctas = widget.preguntasCorrectas + IsCorrecta;

                      widget.preguntas.length - 1 == widget.index
                          ? Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Resultado(
                                        correctas: correctas,
                                        incorrectas:
                                            widget.preguntas.length - correctas,
                                      )),
                              (Route<dynamic> route) => false,
                            )
                          : Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PreguntaBasica(
                                        preguntas: widget.preguntas,
                                        index: widget.index + 1,
                                        preguntasCorrectas: correctas,
                                      )),
                              (Route<dynamic> route) => false,
                            );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      backgroundColor: !comprobar
                          ? Colors.blue
                          : comprobar && selectedOption == null
                              ? Colors.blue
                              : const Color(0xff689734),
                      disabledBackgroundColor: Colors.grey[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      !comprobar
                          ? "Comprobar"
                          : comprobar && selectedOption == null
                              ? "Comprobar"
                              : "Siguiente",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
