import 'package:flutter/material.dart';

class OfertaLaboral {
  final String id;
  final String titulo;
  final String descripcion;
  final String empresa;
  final String categoria;
  final IconData icono;

  OfertaLaboral({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.empresa,
    required this.categoria,
    required this.icono,
  });
}