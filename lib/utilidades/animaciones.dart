import 'package:flutter/animation.dart';

class Animaciones {
  static void iniciarAnimacionSalto(AnimationController controller, {required VoidCallback onComplete}) {
    controller.forward().then((_) {
      controller.reverse().then((_) {
        onComplete();
      });
    });
  }
}