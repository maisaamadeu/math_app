import 'package:get/get.dart';
import 'package:math_app/app/shared/controllers/math_controller.dart';

class MathBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MathController());
  }
}
