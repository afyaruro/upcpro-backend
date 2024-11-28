import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 130,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 202, 202, 202).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 30),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/upcpro.png',
                  width: 80,
                  height: 25,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => _showCompetenciesModal(context),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calculate,
                            color: Color.fromARGB(255, 85, 136, 85),
                            size: 30.0,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          SizedBox(
                            width: 70,
                            child: const Text(
                              "Razonamiento Cuantitativo",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 85, 136, 85)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          color: Color.fromARGB(255, 240, 138, 55),
                          size: 20.0,
                        ),
                        SizedBox(width: 2),
                        Text(
                          "1",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 240, 138, 55)),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.diamond_outlined,
                          color: Color.fromARGB(255, 51, 172, 228),
                          size: 20.0,
                        ),
                        SizedBox(width: 2),
                        Text(
                          "2548k",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 51, 172, 228)),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.favorite_rounded,
                          color: Color.fromARGB(255, 233, 77, 77),
                          size: 20.0,
                        ),
                        SizedBox(width: 2),
                        Text(
                          "10",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 233, 77, 77)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showCompetenciesModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Selecciona una competencia",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _buildCompetencyOption(
                  context, "Razonamiento Cuantitativo", Icons.calculate),
              _buildCompetencyOption(context, "Inglés", Icons.translate),
              _buildCompetencyOption(context, "Lectura Crítica", Icons.book),
              _buildCompetencyOption(
                  context, "Competencias Ciudadanas", Icons.people),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCompetencyOption(
      BuildContext context, String competency, IconData icon) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color.fromARGB(255, 81, 161, 27),
      ),
      title: Text(
        competency,
        style: const TextStyle(fontSize: 16),
      ),
      onTap: () {
        Navigator.pop(context); // Cerrar el modal
        // Aquí puedes manejar la selección de la competencia
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Seleccionaste: $competency')),
        );
      },
    );
  }
}
