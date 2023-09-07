import 'package:flutter/material.dart';
import 'package:masterdesign/routing/generate_route.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  Routing routing = Routing();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routing.generate,
      initialRoute: "/",
    );
  }
}
