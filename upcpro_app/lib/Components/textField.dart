import 'package:flutter/material.dart';

Widget BuildTextField({
  required String hintText,
  required IconData icon,
  required TextEditingController controller,
  bool isPassword = false,
}) {
  return TextField(
    controller: controller,
    obscureText: isPassword,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.white70),
      filled: true,
      fillColor: Colors.white.withOpacity(0.2),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      prefixIcon: Icon(icon, color: Colors.white70),
    ),
  );
}
