import 'package:flutter/material.dart';
import 'package:upcpro_app/Components/header.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          const HeaderHome(),
          const SizedBox(height: 50),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    4, // Más niveles por fila para hacerlo más compacto
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 20, // Número total de niveles
              itemBuilder: (context, index) {
                return _buildLevelTile(
                  level: index + 1,
                  isLocked:
                      index > 5, // Solo los primeros 5 niveles desbloqueados
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelTile({required int level, required bool isLocked}) {
    return GestureDetector(
      onTap: () {
        if (!isLocked) {
          print("Nivel $level seleccionado");
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isLocked
              ? Colors.grey.shade800
              : Color.fromARGB(255, 171, 194, 117),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isLocked
                  ? Colors.black.withOpacity(0.3)
                  : Color.fromARGB(255, 171, 194, 117),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              isLocked
                  ? const Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 24,
                    )
                  : const Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 24,
                    ),
              const SizedBox(height: 8),
              Text(
                isLocked ? "???" : "Nivel $level",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
