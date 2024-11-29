import 'package:flutter/material.dart';
import 'package:upcpro_app/Ui/menu.dart';

class Resultado extends StatelessWidget {
  final int correctas;
  final int incorrectas;

  const Resultado({
    super.key,
    required this.correctas,
    required this.incorrectas,
  });

  @override
  Widget build(BuildContext context) {
    final bool masCorrectas = correctas >= incorrectas;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 252, 245),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                masCorrectas ? "¡Buen trabajo!" : "¡Sigue practicando!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: masCorrectas
                      ? const Color(0xFF4CAF50)
                      : const Color(0xFFF44336),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildResultCard(
                    title: "Correctas",
                    value: correctas,
                    color: const Color(0xFF4CAF50),
                    isHighlighted: masCorrectas,
                  ),
                  const SizedBox(width: 20),
                  _buildResultCard(
                    title: "Incorrectas",
                    value: incorrectas,
                    color: const Color(0xFFF44336),
                    isHighlighted: !masCorrectas,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const BottomMenu()),
                    (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Volver al inicio",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultCard({
    required String title,
    required int value,
    required Color color,
    required bool isHighlighted,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: isHighlighted ? 150 : 120,
      height: isHighlighted ? 200 : 170,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color,
          width: 3,
        ),
        boxShadow: isHighlighted
            ? [
                BoxShadow(
                  color: color.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                )
              ]
            : [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "$value",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
