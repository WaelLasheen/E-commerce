import 'package:e_commerce/provider/purchases.dart';
import 'package:e_commerce/screens/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=>Purchasses(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Products(),
      ),
    );
  }
}
