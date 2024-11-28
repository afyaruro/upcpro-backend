import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> rankingData = [
    {"name": "Juan Pérez", "score": 950, "position": 1},
    {"name": "Ana Gómez", "score": 900, "position": 2},
    {"name": "Carlos López", "score": 850, "position": 3},
    {"name": "María Sánchez", "score": 800, "position": 4},
    {"name": "Luis Torres", "score": 750, "position": 5},
  ];

  RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 245, 248),
      
      body: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: rankingData.length,
              itemBuilder: (context, index) {
                final data = rankingData[index];
                return _buildRankingCard(data);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Fondo degradado
        Container(
          height: 180,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 112, 129, 96),
                Color.fromARGB(255, 164, 194, 144),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        Column(
          children: [
            const Icon(
              Icons.workspace_premium_rounded,
              color: Colors.white,
              size: 60,
            ),
            const SizedBox(height: 10),
            const Text(
              "Ranking",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Top 10 de los mejores puntajes",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(200, 255, 255, 255),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRankingCard(Map<String, dynamic> data) {
    final int position = data["position"];
    final bool isTopThree = position <= 3;
    final List<Color> badgeColors = [
      const Color.fromARGB(255, 255, 215, 0), // Oro
      const Color.fromARGB(255, 192, 192, 192), // Plata
      const Color.fromARGB(255, 205, 127, 50), // Bronce
    ];

    return Container(
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
          // Posición con diseño especial para los 3 primeros
          CircleAvatar(
            radius: 25,
            backgroundColor: isTopThree
                ? badgeColors[position - 1]
                : const Color.fromARGB(255, 240, 240, 240),
            child: Text(
              position.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isTopThree ? Colors.white : Colors.black87,
              ),
            ),
          ),
          const SizedBox(width: 15),
          // Información del usuario
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data["name"],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 50, 50, 50),
                ),
              ),
              Text(
                "Puntos: ${data["score"]}",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          // Ícono especial para los primeros tres lugares
          if (isTopThree)
            Icon(
              Icons.star_rounded,
              color: badgeColors[position - 1],
              size: 30,
            ),
        ],
      ),
    );
  }
}
