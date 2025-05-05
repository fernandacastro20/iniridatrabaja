import 'dart:async';

class GestorConsejos {
  final List<String> consejos;
  int _indiceConsejo = 0;
  Timer? _temporizador;

  GestorConsejos(this.consejos);

  String get consejoActual => consejos[_indiceConsejo % consejos.length];

  void iniciarCambioPeriodico(Function(String) onCambio) {
    _temporizador = Timer.periodic(Duration(seconds: 30), (_) {
      _indiceConsejo++;
      onCambio(consejoActual);
    });
  }

  void cancelarTemporizador() {
    _temporizador?.cancel();
  }
}