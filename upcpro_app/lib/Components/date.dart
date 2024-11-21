import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget BuildDateField({
  required String hintText,
  required BuildContext context,
  TextEditingController? controller,
}) {
  return TextField(
    controller: controller,
    readOnly: true,  // Para que el usuario no edite el texto directamente
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
      suffixIcon: Icon(
        Icons.calendar_today,
        color: Colors.white70,
      ),
    ),
    onTap: () async {
      // Abre el DatePicker cuando el TextField es tocado
      DateTime? pickedDate = await showDatePicker(
        context: context,  // Usa el contexto del controlador
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );
      if (pickedDate != null) {
        // Formatea la fecha seleccionada y la asigna al controller
        controller?.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      }
    },
  );
}
