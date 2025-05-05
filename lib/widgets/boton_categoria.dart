import 'package:flutter/material.dart';

class BotonCategoria extends StatelessWidget {
  final String categoria;
  final bool seleccionada;
  final VoidCallback onPressed;

  BotonCategoria({
    required this.categoria,
    required this.seleccionada,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: seleccionada ? Colors.green : Colors.grey[300],
          foregroundColor: seleccionada ? Colors.white : Colors.black,
        ),
        onPressed: onPressed,
        child: Text(categoria),
      ),
    );
  }
}