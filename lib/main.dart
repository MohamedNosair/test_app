import 'package:flutter/material.dart';
import 'package:test_app/core/network/remote/dio_helper.dart';
import 'package:test_app/features/product/view/product_view.dart';

//! في المشروع دا  هطبق ال MVVM عشان افهما كويس وهحاول اطلع افضل شغل في الملف دا ان شاء الله
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Arch Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProductView(),
    );
  }
}