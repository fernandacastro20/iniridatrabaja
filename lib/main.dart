import 'package:flutter/material.dart';
import 'pantallas/pantalla_inicio.dart';
import 'modelos/oferta_laboral.dart';

void main() {
  runApp(IniridaTrabajaApp());
}

class IniridaTrabajaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inírida no Trabaja',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PantallaInicio(
        ofertas: [
          OfertaLaboral(
            id: '1',
            titulo: 'Agrónomo',
            descripcion: 'Gestión agrícola para cultivo de cacao.',
            empresa: 'AgroInírida',
            categoria: 'Agricultura',
            icono: Icons.agriculture,
          ),
          OfertaLaboral(
            id: '2',
            titulo: 'Vendedor de Ropa',
            descripcion: 'Atención al cliente en tienda de ropa.',
            empresa: 'ModaInírida',
            categoria: 'Comercio de Ropa',
            icono: Icons.shopping_bag,
          ),
          OfertaLaboral(
            id: '3',
            titulo: 'Cajero',
            descripcion: 'Atención en caja.',
            empresa: 'La Canasta',
            categoria: 'Supermercados',
            icono: Icons.store,
          ),
          OfertaLaboral(
            id: '4',
            titulo: 'Cocinero Local',
            descripcion: 'Comida típica con pescado.',
            empresa: 'Comidas del Río',
            categoria: 'Venta de Comida Local',
            icono: Icons.restaurant_menu,
          ),
          OfertaLaboral(
            id: '5',
            titulo: 'Recolector de Frutas',
            descripcion: 'Recolectar frutas en finca ubicada en la ribera.',
            empresa: 'Frutas del Guaviare',
            categoria: 'Agricultura',
            icono: Icons.grass,
          ),
          OfertaLaboral(
            id: '6',
            titulo: 'Asesor de Ventas',
            descripcion: 'Atención personalizada y cierre de ventas.',
            empresa: 'Tienda Éxito',
            categoria: 'Supermercados',
            icono: Icons.support_agent,
          ),
        ],
      ),
    );
  }
}