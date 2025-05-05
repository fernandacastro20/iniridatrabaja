import 'package:flutter/material.dart';
import '../modelos/oferta_laboral.dart';
import '../widgets/tarjeta_oferta.dart';
import 'detalle_oferta.dart';

class PantallaHistorial extends StatelessWidget {
  final List<OfertaLaboral> historial;

  PantallaHistorial({required this.historial});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Historial')),
      body: historial.isEmpty
          ? Center(child: Text('Tu historial está vacío.'))
          : ListView.builder(
              itemCount: historial.length,
              itemBuilder: (context, index) {
                final oferta = historial[index];
                return TarjetaOferta(
                  oferta: oferta,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalleOferta(oferta: oferta),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}