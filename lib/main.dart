import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class ResourceApp extends ChangeNotifier {
  var wood = 0;
  var ironOre = 0;
  var copperOre = 0;
  var coal = 0;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ResourceApp(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        home: const ResourcePage(title: 'Ressources'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class ResourcePage extends StatefulWidget {
  const ResourcePage({super.key, required this.title});
  final String title;
  @override
  State<ResourcePage> createState() => _ResourceState();
}

class _ResourceState extends State<ResourcePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
