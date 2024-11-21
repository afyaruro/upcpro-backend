import 'package:flutter/material.dart';

Widget BuildDropdown({
  required String hintText,
  required List<String> items,
  required String? selectedItem,
  required Function(String?) onChanged,  
  required BuildContext context,

}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 55,
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        dropdownColor: Color.fromARGB(255, 69, 87, 68).withOpacity(0.9),
        value: selectedItem,
        hint: Text(
          hintText,
          style: const TextStyle(color: Colors.white70),
        ),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white70,
        ),
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        onChanged: onChanged,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
      ),
    ),
  );
}
