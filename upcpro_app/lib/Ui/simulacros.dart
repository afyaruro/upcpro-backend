import 'package:flutter/material.dart';

class SimulacrosScreen extends StatelessWidget {
  final List<Map<String, dynamic>> simulacros = [
    // {
    //   "title": "Simulacro Matemáticas",
    //   "description": "Prueba tus habilidades en cálculo y álgebra.",
    //   "duration": "60 min"
    // },
    // {
    //   "title": "Simulacro Lectura Crítica",
    //   "description": "Evalúa tu comprensión lectora.",
    //   "duration": "45 min"
    // },
    // {
    //   "title": "Simulacro Inglés",
    //   "description": "Mide tu nivel de inglés.",
    //   "duration": "30 min"
    // },
    // {
    //   "title": "Simulacro Ciencias",
    //   "description": "Revisa conceptos clave en ciencias.",
    //   "duration": "50 min"
    // },
  ];
  SimulacrosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 245, 248),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: simulacros.length == 0
                ? Center(
                    child: Text("No hay simulacros", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.grey),),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: simulacros.length,
                    itemBuilder: (context, index) {
                      final simulacro = simulacros[index];
                      return _buildSimulacroCard(simulacro);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimulacroCard(Map<String, dynamic> simulacro) {
    return GestureDetector(
      onTap: () {
        // Acción al tocar la tarjeta (por ejemplo, ir a los detalles del simulacro)
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            // Ícono representativo del simulacro
            CircleAvatar(
              radius: 30,
              backgroundColor: const Color.fromARGB(255, 112, 129, 96),
              child: const Icon(
                Icons.library_books_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(width: 15),
            // Información del simulacro
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    simulacro["title"],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 50, 50, 50),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    simulacro["description"],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.timer_outlined,
                        color: Color.fromARGB(255, 112, 129, 96),
                        size: 18,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        simulacro["duration"],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 112, 129, 96),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            // Botón para iniciar simulacro
            ElevatedButton(
              onPressed: () {
                // Acción para iniciar el simulacro
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 112, 129, 96),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Iniciar",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
