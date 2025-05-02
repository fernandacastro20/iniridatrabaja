import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:async'; // Importa la biblioteca async para el Timer

class JobOffer {
  final String id;
  final String title;
  final String description;
  final String company;
  final String category;
  final IconData icon;

  JobOffer({
    required this.id,
    required this.title,
    required this.description,
    required this.company,
    required this.category,
    required this.icon,
  });
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  String selectedCategory = 'Agricultura';
  List<JobOffer> jobOffers = [
    JobOffer(id: '1', title: 'Agrónomo', description: 'Gestión agrícola para cultivo de cacao.', company: 'AgroInírida', category: 'Agricultura', icon: Icons.agriculture),
    JobOffer(id: '2', title: 'Vendedor de Ropa', description: 'Atención al cliente en tienda de ropa.', company: 'ModaInírida', category: 'Comercio de Ropa', icon: Icons.shopping_bag),
    JobOffer(id: '3', title: 'Cajero', description: 'Atención en caja.', company: 'La Canasta', category: 'Supermercados', icon: Icons.store),
    JobOffer(id: '4', title: 'Cocinero Local', description: 'Comida típica con pescado.', company: 'Comidas del Río', category: 'Venta de Comida Local', icon: Icons.restaurant_menu),
    JobOffer(id: '5', title: 'Recolector de Frutas', description: 'Recolectar frutas en finca ubicada en la ribera.', company: 'Frutas del Guaviare', category: 'Agricultura', icon: Icons.grass),
    JobOffer(id: '6', title: 'Asesor de Ventas', description: 'Atención personalizada y cierre de ventas.', company: 'Tienda Éxito', category: 'Supermercados', icon: Icons.support_agent),
    JobOffer(id: '7', title: 'Diseñador de Moda', description: 'Diseño y confección de prendas típicas.', company: 'ArteGuainía', category: 'Comercio de Ropa', icon: Icons.design_services),
    JobOffer(id: '8', title: 'Ayudante de Cocina', description: 'Apoyo en la preparación de alimentos.', company: 'Sabor Amazónico', category: 'Venta de Comida Local', icon: Icons.kitchen),
    JobOffer(id: '9', title: 'Barista', description: 'Preparación de bebidas a base de café.', company: 'Café Orinoquía', category: 'Venta de Comida Local', icon: Icons.coffee),
    JobOffer(id: '10', title: 'Empacador', description: 'Empaque de productos en supermercado.', company: 'Mercado 24H', category: 'Supermercados', icon: Icons.inventory),
    JobOffer(id: '11', title: 'Cultivador de Yuca', description: 'Trabajo rural para producción agrícola.', company: 'AgroYuca SAS', category: 'Agricultura', icon: Icons.nature),
    JobOffer(id: '12', title: 'Dependiente de Boutique', description: 'Atención al cliente y ventas.', company: 'Boutique Amazonas', category: 'Comercio de Ropa', icon: Icons.shopping_cart),
    JobOffer(id: '31', title: 'Operario de Maquinaria Agrícola', description: 'Manejo de tractores y equipos de siembra.', company: 'Campo Fértil', category: 'Agricultura', icon: Icons.build),
    JobOffer(id: '32', title: 'Auxiliar de Bodega', description: 'Organización y control de inventario en supermercado.', company: 'Super Ganga', category: 'Supermercados', icon: Icons.warehouse),
    JobOffer(id: '33', title: 'Panadero', description: 'Elaboración de pan y otros productos de panadería.', company: 'Panadería El Trigal', category: 'Venta de Comida Local', icon: Icons.bakery_dining),
    JobOffer(id: '34', title: 'Costurero/a', description: 'Confección y arreglos de prendas de vestir.', company: 'Creaciones Textiles', category: 'Comercio de Ropa', icon: Icons.cut),
    JobOffer(id: '35', title: 'Jefe de Producción Agrícola', description: 'Planificación y supervisión de cultivos a gran escala.', company: 'Inírida Farms', category: 'Agricultura', icon: Icons.local_florist),
    JobOffer(id: '36', title: 'Carnicero', description: 'Corte y preparación de carnes.', company: 'Carnicería La Vaca Lola', category: 'Supermercados', icon: Icons.bloodtype),
    JobOffer(id: '37', title: 'Mesero/a', description: 'Atención a clientes en restaurante de comida local.', company: 'El Fogón Inírida', category: 'Venta de Comida Local', icon: Icons.restaurant),
    JobOffer(id: '38', title: 'Diseñador Gráfico Jr.', description: 'Creación de material visual para redes sociales y publicidad.', company: 'Pixel Inírida', category: 'Comercio de Ropa', icon: Icons.brush),
    JobOffer(id: '39', title: 'Técnico de Riego', description: 'Instalación y mantenimiento de sistemas de riego agrícola.', company: 'Riego Amazonas', category: 'Agricultura', icon: Icons.invert_colors),
    JobOffer(id: '40', title: 'Reponedor de Mercancía', description: 'Organización y reposición de productos en los estantes.', company: 'Mi Tienda Vecina', category: 'Supermercados', icon: Icons.layers),
    JobOffer(id: '41', title: 'Preparador de Jugos Naturales', description: 'Elaboración de jugos y batidos de frutas locales.', company: 'Jugos del Sol', category: 'Venta de Comida Local', icon: Icons.local_drink),
    JobOffer(id: '42', title: 'Vendedor de Calzado', description: 'Atención al cliente y venta de zapatos y accesorios.', company: 'Pasos Firmes', category: 'Comercio de Ropa', icon: Icons.accessibility),
    JobOffer(id: '43', title: 'Conductor de Bus Rural', description: 'Transporte de pasajeros en áreas rurales.', company: 'Transportes Unidos del Guainía', category: 'Transporte', icon: Icons.bus_alert),
    JobOffer(id: '44', title: 'Profesor de Biología', description: 'Enseñanza de biología en colegio secundario.', company: 'Colegio Inírida', category: 'Educación', icon: Icons.science),
    JobOffer(id: '45', title: 'Electricista Residencial', description: 'Instalaciones y reparaciones eléctricas en hogares.', company: 'Electro Servicios Inírida', category: 'Construcción', icon: Icons.bolt),
    JobOffer(id: '46', title: 'Mecánico de Botes', description: 'Reparación y mantenimiento de motores de embarcaciones.', company: 'ServiNavega', category: 'Automotriz', icon: Icons.directions_boat),
    JobOffer(id: '47', title: 'Guía de Ecoturismo (Bilingüe)', description: 'Guiar turistas en la selva, con dominio de inglés.', company: 'Amazonas EcoAventura', category: 'Turismo', icon: Icons.nature_people),
    JobOffer(id: '48', title: 'Community Manager', description: 'Gestión de redes sociales y creación de contenido digital.', company: 'Conecta Inírida', category: 'Tecnología', icon: Icons.groups),
    JobOffer(id: '49', title: 'Auxiliar de Contabilidad', description: 'Apoyo en tareas contables y administrativas.', company: 'Consultores Inírida', category: 'Servicios', icon: Icons.calculate),
    JobOffer(id: '50', title: 'Enfermero/a General', description: 'Atención de pacientes y administración de medicamentos.', company: 'Clínica Amanecer', category: 'Salud', icon: Icons.healing),
    JobOffer(id: '51', title: 'Promotor de Créditos', description: 'Ofrecer y gestionar productos de crédito.', company: 'CrediAmazonas', category: 'Comercio', icon: Icons.attach_money),
    JobOffer(id: '52', title: 'Instructor de Yoga', description: 'Clases de yoga para bienestar físico y mental.', company: 'Yoga Inírida', category: 'Servicios', icon: Icons.self_improvement),
  ];

  bool hasNewOffers = true;
  late AnimationController _animationController;
  TextEditingController _searchController = TextEditingController();
  List<JobOffer> _filteredJobOffers = [];
  List<JobOffer> _historial = []; // Lista para almacenar el historial

  String _consejoActual = '';
  Timer? _timerConsejos;
  int _indiceConsejo = 0;

  List<String> consejos = [
    "Define tu objetivo laboral: Ten claro qué tipo de trabajo buscas (sector, cargo, jornada, ubicación, salario aproximado).",
    "Actualiza tu hoja de vida (CV)forma y: Resalta tus logros, experiencia, habilidades y formación. Personalízala para cada oferta.",
    "Crea un perfil en plataformas de empleo: Usa portales como Computrabajo, Indeed, LinkedIn, elempleo.com o agencias públicas de empleo.",
    "Aplica de forma estratégica: No envíes tu hoja de vida masivamente. Lee bien cada oferta y adapta tu aplicación según lo que buscan.",
    "Prepara una buena carta de presentación: Destaca por qué eres el candidato ideal para el puesto.",
    "Investiga sobre la empresa: Conoce su misión, valores y cultura antes de la entrevista.",
    "Practica para las entrevistas: Anticipa preguntas comunes y prepara tus respuestas.",
    "Vístete apropiadamente para las entrevistas: La primera impresión cuenta.",
    "Sé puntual en las entrevistas: Demuestra respeto por el tiempo del entrevistador.",
    "Envía un correo de agradecimiento después de la entrevista: Refuerza tu interés en el puesto.",
    // ... puedes añadir más consejos
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    if (hasNewOffers) {
      _startJumpAnimation();
    }
    _filteredJobOffers = List.from(jobOffers);
    _searchController.addListener(_filterJobOffers);
    _mostrarPrimerConsejo(); // Mostrar un consejo inicial
    _iniciarCambioPeriodicoConsejos(); // Iniciar el cambio periódico
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    _timerConsejos?.cancel(); // Cancelar el timer para evitar fugas de memoria
    super.dispose();
  }

  void _mostrarPrimerConsejo() {
    setState(() {
      _consejoActual = consejos[_indiceConsejo % consejos.length];
    });
  }

  void _iniciarCambioPeriodicoConsejos() {
    _timerConsejos = Timer.periodic(const Duration(seconds: 30), (timer) { // Cambiado a 30 segundos
      setState(() {
        _indiceConsejo++;
        _consejoActual = consejos[_indiceConsejo % consejos.length];
      });
    });
  }

  void _mostrarNuevoConsejo() {
    setState(() {
      _indiceConsejo++;
      _consejoActual = consejos[_indiceConsejo % consejos.length];
    });
  }

  void _startJumpAnimation() {
    _animationController.forward().then((_) {
      _animationController.reverse().then((_) {
        if (hasNewOffers) {
          Future.delayed(const Duration(seconds: 2), _startJumpAnimation);
        }
      });
    });
  }

  void _markOffersAsSeen() {
    setState(() {
      hasNewOffers = false;
      _animationController.stop();
    });
  }

  void _filterJobOffers() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredJobOffers = jobOffers.where((offer) {
        return offer.title.toLowerCase().contains(query) ||
            offer.company.toLowerCase().contains(query) ||
            offer.description.toLowerCase().contains(query) ||
            offer.category.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _agregarAlHistorial(JobOffer oferta) {
    setState(() {
      if (!_historial.any((o) => o.id == oferta.id)) {
        _historial.insert(0, oferta); // Agregar al inicio para mostrar lo más reciente primero
      }
    });
  }

  void _showPostJobDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Publicar Oferta'),
        contentPadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0), // Añade padding horizontal
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8, // Ocupa el 80% del ancho de la pantalla
          child: PostJobForm(
            onSubmit: (JobOffer newOffer) {
              setState(() {
                jobOffers.add(newOffer);
                _filterJobOffers();
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${newOffer.title} publicada!')),
              );
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<JobOffer> categoryFilteredOffers = _filteredJobOffers.where((offer) => offer.category == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Inírida trabaja', style: TextStyle(color: Colors.white)),
            SizedBox(height: 4),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('¡Aquí irían tus notificaciones!')),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.notifications, color: const Color.fromARGB(255, 255, 196, 33), size: 18),
                  SizedBox(width: 4),
                  Text('Notificaciones', style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 10, 131, 50),
        leading: GestureDetector(
          onTap: () {
            _markOffersAsSeen();
            _mostrarNuevoConsejo();
          },
          child: Center(
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: hasNewOffers ? -10 : 0),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              builder: (BuildContext context, double value, Widget? child) {
                return Transform.translate(
                  offset: Offset(0, value),
                  child: child,
                );
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/avatar_indigena.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HistorialScreen(historial: _historial)),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.mail_outline, color: const Color.fromARGB(255, 255, 254, 254)),
                  SizedBox(height: 2),
                  Text('Historial', style: TextStyle(color: Colors.white, fontSize: 10)),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SuggestionBoxScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lightbulb_outline, color: const Color.fromARGB(255, 255, 231, 18)),
                  SizedBox(height: 2),
                Text('Sugerencias', style: TextStyle(color: Colors.white, fontSize: 10)),
                ],
              ),
            ),
          ),
          SizedBox(width: 8),
          SizedBox(
            width: 150,
            child: Align(
              alignment: Alignment.centerRight,
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: const Color.fromRGBO(255, 61, 59, 1)),
                decoration: InputDecoration(
                  hintText: 'Buscar ofertasS',
                  hintStyle: TextStyle(color: const Color.fromARGB(179, 27, 27, 27)),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: const Color.fromARGB(255, 2, 170, 58)),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 252, 255, 252),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Barra de Consejos
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            color: const Color.fromARGB(255, 249, 255, 194), // Un color suave para la barra
            child: Text(
              _consejoActual,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.green[700]),
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 8),
                _CategoryButton('Agricultura'),
                _CategoryButton('Comercio de Ropa'),
                _CategoryButton('Supermercados'),
                _CategoryButton('Venta de Comida Local'),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _showPostJobDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 231, 100, 48),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text('Publicar Oferta', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: categoryFilteredOffers.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: JobCard(jobOffer: categoryFilteredOffers[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _CategoryButton(String category) {
    final isSelected = selectedCategory == category;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedCategory = category;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? const Color.fromARGB(255, 10, 163, 56) : Colors.grey[300],
          foregroundColor: isSelected ? const Color.fromARGB(255, 255, 253, 253) : Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(category, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final JobOffer jobOffer;
  JobCard({required this.jobOffer});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: const Color.fromARGB(255, 185, 211, 255),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Agregar al historial al tocar la tarjeta
          final homeScreenState = context.findAncestorStateOfType<_HomeScreenState>();
          if (homeScreenState != null) {
            homeScreenState._agregarAlHistorial(jobOffer);
          }
          Navigator.push(context, MaterialPageRoute(builder: (_) => ApplicationScreen(jobOffer: jobOffer)));
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(jobOffer.icon, size: 30, color: const Color.fromARGB(255, 255, 255, 255)),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(jobOffer.title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(jobOffer.company, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ApplicationScreen extends StatelessWidget {
  final JobOffer jobOffer;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cvController = TextEditingController();

  ApplicationScreen({required this.jobOffer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Postúlate a ${jobOffer.title}')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          constraints: BoxConstraints(maxWidth: 450),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildField('Nombre', nameController),
                  SizedBox(height: 12),
                  _buildField('Correo Electrónico', emailController),
                  SizedBox(height: 12),
                  _buildField('CV (enlace o detalles)', cvController),
                  SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('¡Postulación enviada!'),
                          content: Text('Gracias por postularte a ${jobOffer.title}.'),
                          actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('Cerrar'))],
                        ),
                      );
                    },
                    icon: Icon(Icons.send),
                    label: Text('Enviar Postulación'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 251, 251, 255),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          ),
        ),
      ],
    );
  }
}

class PostJobForm extends StatefulWidget {
  final Function(JobOffer) onSubmit;

  PostJobForm({required this.onSubmit});

  @override
  _PostJobFormState createState() => _PostJobFormState();
}

class _PostJobFormState extends State<PostJobForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController publishDateController = TextEditingController();
  final TextEditingController deadlineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: titleController, decoration: InputDecoration(labelText: 'Título', border: OutlineInputBorder())),
          SizedBox(height: 12),
          TextField(controller: descriptionController, maxLines: 3, decoration: InputDecoration(labelText: 'Descripción', border: OutlineInputBorder())),
          SizedBox(height: 12),
          TextField(controller: companyController, decoration: InputDecoration(labelText: 'Empresa', border: OutlineInputBorder())),
          SizedBox(height: 12),
          TextField(controller: categoryController, decoration: InputDecoration(labelText: 'Categoría', border: OutlineInputBorder())),
          SizedBox(height: 12),
          TextField(controller: locationController, decoration: InputDecoration(labelText: 'Ubicación', border: OutlineInputBorder())),
          SizedBox(height: 12),
          TextField(controller: salaryController, decoration: InputDecoration(labelText: 'Salario (Opcional)', border: OutlineInputBorder())),
          SizedBox(height: 12),
          TextField(controller: publishDateController, decoration: InputDecoration(labelText: 'Fecha de Publicación (Opcional)', border: OutlineInputBorder())),
          SizedBox(height: 12),
          TextField(controller: deadlineController, decoration: InputDecoration(labelText: 'Fecha Límite de Postulación (Opcional)', border: OutlineInputBorder())),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              widget.onSubmit(
                JobOffer(
                  id: DateTime.now().toString(),
                  title: titleController.text,
                  description: descriptionController.text,
                  company: companyController.text,
                  category: categoryController.text,
                  icon: Icons.work,
                ),
              );
            },
            child: Text('Publicar Oferta'),
          ),
        ],
      ),
    );
  }
}

class SuggestionBoxScreen extends StatefulWidget {
  @override
  _SuggestionBoxScreenState createState() => _SuggestionBoxScreenState();
}

class _SuggestionBoxScreenState extends State<SuggestionBoxScreen> {
  final TextEditingController _suggestionController = TextEditingController();

  void _enviarSugerencia(BuildContext context) {
    String sugerencia = _suggestionController.text.trim();
    if (sugerencia.isNotEmpty) {
      // Aquí iría la lógica para enviar la sugerencia
      // Podrías imprimirla en la consola por ahora o integrarla con un backend
      print('Sugerencia enviada: $sugerencia');

      // Mostrar un mensaje de agradecimiento
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('¡Gracias por tu sugerencia!')),
      );

      // Limpiar el campo de texto
      _suggestionController.clear();
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '¿Tienes alguna idea para mejorar Inírida trabaja? ¡Déjanos tu sugerencia!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _suggestionController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Escribe aquí tu sugerencia...',
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _enviarSugerencia(context),
              child: Text('Enviar Sugerencia', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HistorialScreen extends StatelessWidget {
  final List<JobOffer> historial; // Recibe la lista del historial

  HistorialScreen({required this.historial});

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
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Icon(oferta.icon),
                    title: Text(oferta.title),
                    subtitle: Text(oferta.company),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ApplicationScreen(jobOffer: oferta)),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}

void main() => runApp(MaterialApp(home: HomeScreen()));