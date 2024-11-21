
import 'package:flutter/material.dart';
import 'package:upcpro_app/Utils/styles.dart';

class ProgresoSign extends StatelessWidget {
  final double porcentaje;
  const ProgresoSign({super.key, required this.porcentaje});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth(context),
      color: const Color.fromARGB(255, 224, 227, 230),
      height: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: const Color.fromARGB(255, 153, 187, 146),
            width: porcentaje,
          ),
        ],
      ),
    );
  }
}