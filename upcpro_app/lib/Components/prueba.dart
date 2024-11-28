import 'package:flutter/material.dart';

class DiamondIconExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ícono de Diamante'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.diamond,
                color: Colors.blueAccent,
                size: 40.0,
              ),
            );
          }),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DiamondIconExample(),
  ));
}
