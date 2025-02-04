import 'package:mobile_app/page_answer/answer_portal.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/from_simple.dart';
import 'package:mobile_app/registrasion_from.dart';
import 'package:mobile_app/Air_Quality_Index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAir(),
    );
  }
}