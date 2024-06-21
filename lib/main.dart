import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice/features/view_invoice/presentaion/view_invoice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const InvoicesHome(),
    );
  }
}
