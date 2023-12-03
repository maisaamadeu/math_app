import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_app/app/pages/home_page.dart';
import 'package:math_app/app/shared/bindings/math_binding.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MathBinding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ),
      ),
      home: HomePage(),
    );
  }
}
