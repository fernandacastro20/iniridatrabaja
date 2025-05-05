import 'package:flutter/material.dart';
import '../modelos/oferta_laboral.dart';

class FormularioPublicar extends StatefulWidget {
  final Function(OfertaLaboral) onSubmit;

  FormularioPublicar({required this.onSubmit});

  @override
  _FormularioPublicarState createState() => _FormularioPublicarState();
}

class _FormularioPublicarState extends State<FormularioPublicar> {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _empresaController = TextEditingController();
  final _categoriaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: _tituloController,
              decoration: InputDecoration(labelText: 'Título de la Oferta'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa un título.';
                }
                return null;
              },
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _descripcionController,
              decoration: InputDecoration(labelText: 'Descripción'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa una descripción.';
                }
                return null;
              },
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _empresaController,
              decoration: InputDecoration(labelText: 'Empresa'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa el nombre de la empresa.';
                }
                return null;
              },
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _categoriaController,
              decoration: InputDecoration(labelText: 'Categoría'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa una categoría.';
                }
                return null;
              },
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final nuevaOferta = OfertaLaboral(
                    id: DateTime.now().toString(),
                    titulo: _tituloController.text,
                    descripcion: _descripcionController.text,
                    empresa: _empresaController.text,
                    categoria: _categoriaController.text,
                    icono: Icons.work, // Icono predeterminado
                  );
                  widget.onSubmit(nuevaOferta);
                }
              },
              child: Text('Publicar'),
            ),
          ],
        ),
      ),
    );
  }
}