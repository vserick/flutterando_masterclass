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

class MyApp extends Widget {
  const MyApp({super.key});

  @override
  Element createElement() {
    return MyAppElement(this);
  }
}

class MyAppElement extends ComponentElement {
  MyAppElement(super.widget);

  @override
  Widget build() {
    return const MaterialApp(
        title: 'Mockups',
        debugShowCheckedModeBanner: false,
        home: MockupExpenses());
  }
}
