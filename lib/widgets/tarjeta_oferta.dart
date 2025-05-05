import 'package:flutter/material.dart';
import '../modelos/oferta_laboral.dart'; // Importa la clase desde el archivo correcto

class TarjetaOferta extends StatelessWidget {
  final OfertaLaboral oferta;
  final VoidCallback onTap;

  TarjetaOferta({required this.oferta, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Detecta el toque en la tarjeta
      child: Card(
        color: Colors.lightBlue[50], // Fondo azul claro
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
        ),
        elevation: 4.0, // Sombra para el Card
        child: ListTile(
          leading: Icon(oferta.icono, color: Colors.blue), // Ícono azul
          title: Text(
            oferta.titulo,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue), // Título en negrita
          ),
          subtitle: Text(oferta.descripcion), // Descripción de la oferta
          trailing: Text(oferta.empresa), // Nombre de la empresa
        ),
      ),
    );
  }
}