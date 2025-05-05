import 'package:flutter/material.dart';
import '../modelos/oferta_laboral.dart';

class DetalleOferta extends StatelessWidget {
  final OfertaLaboral oferta;

  DetalleOferta({required this.oferta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Inírida Trabaja',
          style: TextStyle(
            fontSize: 24, // Tamaño de la fuente
            fontWeight: FontWeight.bold, // Negrita
            color: const Color.fromARGB(255, 255, 251, 251), // Color del texto
            fontFamily: 'Arial', // Fuente personalizada (opcional)
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 169, 219, 171), // Color de fondo de la AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              oferta.titulo,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              oferta.descripcion,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Empresa: ${oferta.empresa}',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: const Color.fromARGB(255, 240, 240, 240), // Cambia el color de fondo
                    title: Text(
                      'Confirmación',
                      style: TextStyle(color: Colors.black), // Cambia el color del texto del título
                    ),
                    content: Text(
                      '¿Estás seguro de que deseas postularte a esta oferta?',
                      style: TextStyle(color: Colors.black87), // Cambia el color del texto del contenido
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0), // Bordes redondeados
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Cierra el diálogo
                        },
                        child: Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.red), // Cambia el color del texto del botón
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Cierra el diálogo
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Te has postulado a esta oferta.',
                                style: TextStyle(color: Colors.white), // Cambia el color del texto
                              ),
                              backgroundColor: Colors.green, // Cambia el color de fondo del SnackBar
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Cambia el color del botón
                          foregroundColor: Colors.white, // Cambia el color del texto del botón
                        ),
                        child: Text('Confirmar'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Cambia el color del botón principal
                foregroundColor: Colors.white, // Cambia el color del texto del botón principal
              ),
              child: Text('Postularme'),
            ),
          ],
        ),
      ),
    );
  }
}