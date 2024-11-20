import 'package:flutter/material.dart';

class PreguntaBasica extends StatefulWidget {
  const PreguntaBasica({super.key});

  @override
  State<PreguntaBasica> createState() => _PreguntaBasicaState();
}

class _PreguntaBasicaState extends State<PreguntaBasica> {
  final List<String> options = [
    'Flutter es un framework de Google',
    'Flutter es un lenguaje de programación',
    'Flutter solo funciona con Android',
    'Flutter es una librería para JavaScript',
  ];

  int? selectedOption; // Opción seleccionada

  void selectOption(int index) {
    setState(() {
      selectedOption = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {},
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
                          width: 100,
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
                    '¿Qué es Flutter?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Expanded(
                  child: Column(
                    children: [
                      for (var i = 0; i < options.length; i++)
                        GestureDetector(
                          onTap: () => selectOption(i),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: selectedOption == i
                                  ? const Color.fromARGB(255, 203, 231, 190)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: selectedOption == i
                                    ? const Color(0xff689734)
                                    : Colors.grey[300]!,
                                width: 2,
                              ),
                              boxShadow: selectedOption == i
                                  ? [
                                      BoxShadow(
                                        color: const Color(0xff689734)
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
                                      ? const Color(0xff689734)
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
                                          ? const Color(0xff689734)
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
              ),

              SizedBox(
                height: 120,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      backgroundColor: const Color(0xff689734),
                      disabledBackgroundColor: Colors.grey[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Siguiente",
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
