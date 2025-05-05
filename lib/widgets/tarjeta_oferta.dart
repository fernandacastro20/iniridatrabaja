import 'package:flutter/material.dart';
import '../modelos/oferta_laboral.dart';
import '../pantallas/pantalla_postulacion.dart';

class TarjetaOferta extends StatelessWidget {
  final OfertaLaboral oferta;
  final VoidCallback? onTap;

  TarjetaOferta({required this.oferta, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: Icon(oferta.icono, size: 40),
        title: Text(oferta.titulo),
        subtitle: Text(oferta.descripcion),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          if (onTap != null) onTap!();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PantallaPostulacion(oferta: oferta),
            ),
          );
        },
      ),
    );
  }
}