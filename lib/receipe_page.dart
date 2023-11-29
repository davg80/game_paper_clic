import 'package:flutter/material.dart';

class ReceipePage extends StatefulWidget {
  const ReceipePage({super.key});

  @override
  State<ReceipePage> createState() => _ReceipePageState();
}

class _ReceipePageState extends State<ReceipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recettes'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(children: []),
    );
  }
}
