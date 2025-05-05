import 'package:flutter/material.dart';
import '../modelos/oferta_laboral.dart';
import '../widgets/tarjeta_oferta.dart';
import '../widgets/boton_categoria.dart';
import '../formularios/formulario_publicar.dart';
import '../utilidades/gestor_consejos.dart';
import 'detalle_oferta.dart';

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

  void filtrarBusqueda(String query) {
    setState(() {
      ofertasFiltradas = widget.ofertas
          .where((oferta) =>
              oferta.titulo.toLowerCase().contains(query.toLowerCase()) ||
              oferta.descripcion.toLowerCase().contains(query.toLowerCase()))
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
        backgroundColor: const Color.fromARGB(255, 226, 214, 248), // Cambia el color de fondo
        title: Text(
          'Publicar Oferta',
          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)), // Cambia el color del texto del título
        ),
        content: FormularioPublicar(
          onSubmit: (nuevaOferta) {
            setState(() {
              widget.ofertas.add(nuevaOferta);
              filtrarOfertas(categoriaSeleccionada);
            });
            Navigator.pop(context);
          },
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0), // Bordes redondeados
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Inírida Trabaja'), // Título de la AppBar
            SizedBox(
              width: 200, // Ancho de la barra de búsqueda
              child: TextField(
                onChanged: (value) {
                  filtrarBusqueda(value); // Llama a la función para filtrar las ofertas
                },
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  hintStyle: TextStyle(color: const Color.fromARGB(179, 251, 255, 251)),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: const Color.fromARGB(57, 0, 0, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 155, 255, 158),
      ),
      body: Column(
        children: [
          // Contenedor del Gestor de Consejos
          Container(
            padding: EdgeInsets.all(8.0),
            color: const Color.fromARGB(255, 255, 245, 151),
            child: Text(
              consejoActual,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 13, 73, 17)),
            ),
          ),

          // Espacio entre el Gestor de Consejos y los Botones de Categorías
          SizedBox(height: 16.0), // Espacio de 16 píxeles

          // Botones de Categorías y Botón "Publicar Oferta"
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
                SizedBox(width: 8.0), // Espacio entre los botones de categorías y el botón "Publicar Oferta"
                ElevatedButton(
                  onPressed: () => mostrarFormularioPublicar(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 82, 35, 255), // Cambia el color de fondo
                    foregroundColor: Colors.white, // Cambia el color del texto
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Ajusta el tamaño del botón
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
                    ),
                  ),
                  child: Text('Publicar Oferta'),
                ),
              ],
            ),
          ),

          // Lista de ofertas filtradas
          Expanded(
            child: ListView.builder(
              itemCount: ofertasFiltradas.length,
              itemBuilder: (context, index) {
                final oferta = ofertasFiltradas[index];
                return TarjetaOferta(
                  oferta: oferta,
                  onTap: () {
                    agregarAlHistorial(oferta);
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
          ),
        ],
      ),
    );
  }
}