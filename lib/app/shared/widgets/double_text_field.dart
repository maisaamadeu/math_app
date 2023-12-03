import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_app/app/shared/controllers/math_controller.dart';

class DoubleTextField extends StatelessWidget {
  DoubleTextField({
    Key? key,
    required this.firstHintText,
    required this.secondHintText,
    required this.firstTextEditingController,
    required this.secondTextEditingController,
    required this.point,
  }) : super(key: key);

  final String firstHintText;
  final String secondHintText;
  final String point;
  final TextEditingController firstTextEditingController;
  final TextEditingController secondTextEditingController;

  final controller = Get.find<MathController>();
  final numberRegExp = RegExp(r'^-?[0-9]*\.?[0-9]*$');

  void showSnackbarError(BuildContext context, String errorMessage) {
    final snackbar = SnackBar(
      content: Text(
        errorMessage,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.3),
            offset: const Offset(8, 8),
            blurRadius: 25,
            spreadRadius: -10,
          ),
        ],
        borderRadius: BorderRadius.circular(500),
      ),
      child: Row(
        children: [
          _buildTextField(
              context, firstTextEditingController, firstHintText, point),
          _buildDivider(),
          _buildTextField(
              context, secondTextEditingController, secondHintText, point),
        ],
      ),
    );
  }

  Widget _buildTextField(BuildContext context, TextEditingController controller,
      String hintText, String point) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          errorStyle: const TextStyle(height: 0),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            showSnackbarError(context,
                'O valor de $hintText do ponto ${point.replaceAll("Ponto ", "")} não pode ficar vazio!');
            return '';
          }
          if (!numberRegExp.hasMatch(value)) {
            showSnackbarError(context,
                'O valor de $hintText do ponto ${point.replaceAll("Ponto ", "")} é inválido! Lembre-se: é apenas números! Exemplo: 1, 1.0');
            return '';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      color: Colors.grey.withOpacity(0.5),
      width: 2,
      height: 30,
      margin: const EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
