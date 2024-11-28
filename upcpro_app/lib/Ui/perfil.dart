import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 245, 248),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              const SizedBox(height: 30),
              _buildStatistics(),
              const SizedBox(height: 20),
              _buildOptionsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatistics() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 5),
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/upcpro.png',
            height: 40,
            width: 70,
            fit: BoxFit.cover,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatisticItem("0", "Simulacros"),
              _buildStatisticItem("7", "Rankings"),
              _buildStatisticItem("0", "Certificados"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 112, 129, 96),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 99, 115, 138),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionsList() {
    final List<Map<String, dynamic>> options = [
      {
        'icon': Icons.person,
        'text': 'Datos Personales',
        'color': Colors.blue,
        'action': () {},
      },
      {
        'icon': Icons.badge_outlined,
        'text': 'Certificados',
        'color': Colors.orange,
        'action': () {},
      },
      {
        'icon': Icons.lock,
        'text': 'Cambiar Contraseña',
        'color': Colors.red,
        'action': () {},
      },
      {
        'icon': Icons.exit_to_app,
        'text': 'Cerrar Sesión',
        'color': Colors.purple,
        'action': () {},
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: options.length,
      separatorBuilder: (_, __) => const SizedBox(height: 15),
      itemBuilder: (context, index) {
        final option = options[index];
        return InkWell(
          onTap: option['action'],
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 3),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: option['color']?.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(option['icon'], color: option['color']),
                ),
                const SizedBox(width: 15),
                Text(
                  option['text'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 34, 45, 67),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
