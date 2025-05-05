import 'package:flutter/material.dart';

class PantallaSugerencias extends StatefulWidget {
  @override
  _PantallaSugerenciasState createState() => _PantallaSugerenciasState();
}

class _PantallaSugerenciasState extends State<PantallaSugerencias> {
  final TextEditingController _controladorSugerencias = TextEditingController();

  void enviarSugerencia() {
    final sugerencia = _controladorSugerencias.text.trim();
    if (sugerencia.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('¡Gracias por tu sugerencia!')),
      );
      _controladorSugerencias.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, escribe tu sugerencia.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buzón de Sugerencias')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              '¿Tienes alguna idea para mejorar Inírida Trabaja? ¡Déjanos tu sugerencia!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _controladorSugerencias,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Escribe aquí tu sugerencia...',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: enviarSugerencia,
              child: Text('Enviar Sugerencia'),
            ),
          ],
        ),
      ),
    );
  }
}