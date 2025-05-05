import 'package:flutter/material.dart';
import '../modelos/oferta_laboral.dart';
import '../widgets/tarjeta_oferta.dart';
import '../widgets/boton_categoria.dart';
import '../formularios/formulario_publicar.dart';
import '../utilidades/gestor_consejos.dart';
import 'pantalla_historial.dart';
import 'pantalla_sugerencias.dart';

class PantallaInicio extends StatefulWidget {
  final List<OfertaLaboral> ofertas;

  PantallaInicio({required this.ofertas});

  @override
  _PantallaInicioState createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  String categoriaSeleccionada = 'Agricultura';
  List<OfertaLaboral> historial = [];
  List<OfertaLaboral> ofertasFiltradas = [];
  String consejoActual = '';
  late GestorConsejos gestorConsejos;

  @override
  void initState() {
    super.initState();
    ofertasFiltradas = widget.ofertas;
    gestorConsejos = GestorConsejos([
      "Define tu objetivo laboral: Ten claro qué tipo de trabajo buscas.",
      "Actualiza tu hoja de vida: Resalta tus logros y habilidades.",
      "Aplica de forma estratégica: Adapta tu aplicación según la oferta.",
      "Practica para las entrevistas: Prepara respuestas a preguntas comunes.",
    ]);
    consejoActual = gestorConsejos.consejoActual;
    gestorConsejos.iniciarCambioPeriodico((nuevoConsejo) {
      setState(() {
        consejoActual = nuevoConsejo;
      });
    });
  }

  @override
  void dispose() {
    gestorConsejos.cancelarTemporizador();
    super.dispose();
  }

  void filtrarOfertas(String categoria) {
    setState(() {
      categoriaSeleccionada = categoria;
      ofertasFiltradas = widget.ofertas
          .where((oferta) => oferta.categoria == categoria)
          .toList();
    });
  }

  void agregarAlHistorial(OfertaLaboral oferta) {
    setState(() {
      if (!historial.any((o) => o.id == oferta.id)) {
        historial.insert(0, oferta);
      }
    });
  }

  void mostrarFormularioPublicar(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Publicar Oferta'),
        content: FormularioPublicar(
          onSubmit: (nuevaOferta) {
            setState(() {
              widget.ofertas.add(nuevaOferta);
              filtrarOfertas(categoriaSeleccionada);
            });
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inírida Trabaja'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PantallaHistorial(historial: historial),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.lightbulb_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PantallaSugerencias()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.yellow[100],
            child: Text(
              consejoActual,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.green[700]),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                BotonCategoria(
                  categoria: 'Agricultura',
                  seleccionada: categoriaSeleccionada == 'Agricultura',
                  onPressed: () => filtrarOfertas('Agricultura'),
                ),
                BotonCategoria(
                  categoria: 'Comercio de Ropa',
                  seleccionada: categoriaSeleccionada == 'Comercio de Ropa',
                  onPressed: () => filtrarOfertas('Comercio de Ropa'),
                ),
                BotonCategoria(
                  categoria: 'Supermercados',
                  seleccionada: categoriaSeleccionada == 'Supermercados',
                  onPressed: () => filtrarOfertas('Supermercados'),
                ),
                BotonCategoria(
                  categoria: 'Venta de Comida Local',
                  seleccionada: categoriaSeleccionada == 'Venta de Comida Local',
                  onPressed: () => filtrarOfertas('Venta de Comida Local'),
                ),
                ElevatedButton(
                  onPressed: () => mostrarFormularioPublicar(context),
                  child: Text('Publicar Oferta'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ofertasFiltradas.length,
              itemBuilder: (context, index) {
                final oferta = ofertasFiltradas[index];
                return TarjetaOferta(
                  oferta: oferta,
                  onTap: () => agregarAlHistorial(oferta),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}