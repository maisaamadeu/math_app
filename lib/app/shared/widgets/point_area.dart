import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_app/app/shared/widgets/double_text_field.dart';

class PointArea extends StatelessWidget {
  const PointArea({
    Key? key,
    required this.firstTextEditingController,
    required this.secondTextEditingController,
    required this.pointLabel,
  }) : super(key: key);

  final String pointLabel;
  final TextEditingController firstTextEditingController;
  final TextEditingController secondTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildPointLabel(pointLabel),
        const SizedBox(height: 20),
        DoubleTextField(
          firstHintText: 'X',
          secondHintText: 'Y',
          firstTextEditingController: firstTextEditingController,
          secondTextEditingController: secondTextEditingController,
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildPointLabel(String label) {
    return Text(
      label,
      style: GoogleFonts.inter(
        fontSize: 20,
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.start,
    );
  }
}
