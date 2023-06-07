import 'package:flutter/material.dart';
import 'package:testchallange/core/constants/colors.dart';
import 'package:testchallange/screens/subscribe_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // com.testchallange.flutterigor.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          onBackground: const Color(0xff1D1D1F),
          background: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const SubscribeScreen(),
    );
  }
}
