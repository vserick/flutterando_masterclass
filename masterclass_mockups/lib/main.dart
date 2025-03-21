import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:mockups/mockup_expenses.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (_) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Mockups',
        debugShowCheckedModeBanner: false,
        home: MockupExpenses());
  }
}
