import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_app/app/shared/controllers/math_controller.dart';
import 'package:math_app/app/shared/widgets/point_area.dart';

class HomePage extends GetView<MathController> {
  HomePage({super.key});

  @override
  final controller = Get.put<MathController>(MathController());

  void showSnackbarError(BuildContext context, String errorMessage) {
    final snackbar = SnackBar(
      content: Text(
        errorMessage,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 500,
                ),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      PointArea(
                        firstTextEditingController: controller.pointA[0],
                        secondTextEditingController: controller.pointA[1],
                        pointLabel: 'Ponto A',
                      ),
                      PointArea(
                        firstTextEditingController: controller.pointB[0],
                        secondTextEditingController: controller.pointB[1],
                        pointLabel: 'Ponto B',
                      ),
                      PointArea(
                        firstTextEditingController: controller.pointC[0],
                        secondTextEditingController: controller.pointC[1],
                        pointLabel: 'Ponto C',
                      ),
                      SizedBox(
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () =>
                              controller.calculateDeterminant(context: context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Text(
                            'Calcular',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Obx(() {
                        if (controller.isFirst.value) {
                          return Container();
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: 'Determinante: ',
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: controller.determinant
                                          .toStringAsFixed(2),
                                      style: GoogleFonts.inter(
                                        fontSize: 20,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                controller.isAlign.value
                                    ? 'Estão alinhados!'
                                    : 'Não estão alinhados',
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(height: 10),
                              controller.isAlign.value == false
                                  ? Text.rich(
                                      TextSpan(
                                        text: 'Área: ',
                                        style: GoogleFonts.inter(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                "${controller.area.value.toStringAsFixed(2)} u.a.",
                                            style: GoogleFonts.inter(
                                              fontSize: 20,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                            ],
                          );
                        }
                      })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
