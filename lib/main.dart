import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2022110065/providers/cart_provider.dart';
import 'package:uts_2022110065/providers/product_provider.dart';
import 'package:uts_2022110065/screens/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'uts_2022110065',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(), // diawalan masuk login
    );
  }
}