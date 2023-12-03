import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrices/matrices.dart';

class MathController extends GetxController {
  final List<TextEditingController> pointA =
      List.generate(2, (_) => TextEditingController());
  final List<TextEditingController> pointB =
      List.generate(2, (_) => TextEditingController());
  final List<TextEditingController> pointC =
      List.generate(2, (_) => TextEditingController());

  final formKey = GlobalKey<FormState>();

  final RxBool isFirst = true.obs;
  final RxBool isAlign = false.obs;
  final RxDouble determinant = 0.0.obs;
  final RxDouble area = 0.0.obs;

  void calculateDeterminant({required BuildContext context}) {
    bool validator = validateForm();

    if (!validator) return;

    try {
      final matrix = SquareMatrix.fromList([
        [
          double.parse(pointA[0].text),
          double.parse(pointA[1].text),
          1,
        ],
        [
          double.parse(pointB[0].text),
          double.parse(pointB[1].text),
          1,
        ],
        [
          double.parse(pointC[0].text),
          double.parse(pointC[1].text),
          1,
        ],
      ]);

      // Calcula o determinante da matriz
      determinant.value = matrix.determinant;

      // Verifica se os pontos estão alinhados
      if (determinant.value == 0.0 || determinant.value == -0.0) {
        determinant.value = 0.0;
        isAlign(true);
      } else {
        isAlign(false);

        // Calcula a area
        if (determinant.value < 0) {
          area.value = (determinant.value * -1) * (1 / 2);
        } else {
          area.value = determinant.value * (1 / 2);
        }
      }

      // Atualiza a tela falando que não é mais a primeira vez
      isFirst(false);
    } catch (e) {
      // Handle exceptions related to parsing
      // You may want to provide feedback to the user in the UI
      // For example, show a message that the input is invalid
    }
  }

  bool validateForm() {
    return formKey.currentState!.validate();
  }
}
