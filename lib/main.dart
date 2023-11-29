import 'package:flutter/material.dart';
import 'package:game_paper_clic/receipe_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class ResourceApp extends ChangeNotifier {
  var woodColor = const Color.fromRGBO(150, 121, 105, 1);
  var ironOreColor = const Color.fromRGBO(206, 212, 218, 1);
  var copperOreColor = const Color.fromRGBO(217, 72, 15, 1);
  var coalColor = const Color.fromRGBO(0, 0, 0, 1);
  var wood = 0;
  var ironOre = 0;
  var copperOre = 0;
  var coal = 0;

  void incrementWood() {
    wood++;
    notifyListeners();
  }

  void incrementIronOre() {
    ironOre++;
    notifyListeners();
  }

  void incrementCopperOre() {
    copperOre++;
    notifyListeners();
  }

  void incrementCoal() {
    coal++;
    notifyListeners();
  }
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
  void _incrementCounterWood() {
    var appStateWood = Provider.of<ResourceApp>(context, listen: false);
    appStateWood.incrementWood();
  }

  void _incrementCounterIronOre() {
    var appStateIronOre = Provider.of<ResourceApp>(context, listen: false);
    appStateIronOre.incrementIronOre();
  }

  void _incrementCounterCopperOre() {
    var appStateCopperOre = Provider.of<ResourceApp>(context, listen: false);
    appStateCopperOre.incrementCopperOre();
  }

  void _incrementCounterCoal() {
    var appStateCoal = Provider.of<ResourceApp>(context, listen: false);
    appStateCoal.incrementCoal();
  }

  void _navigate() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ReceipePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.local_atm_outlined),
          onPressed: () {
            _navigate();
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 4,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Provider.of<ResourceApp>(context).woodColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(children: [
                        const Text('Wood'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              _incrementCounterWood();
                            },
                            child: Text(Provider.of<ResourceApp>(context)
                                .wood
                                .toString()),
                          ),
                        )
                      ]),
                    )
                  ],
                ),
              ),
              Container(
                width: 200,
                height: 200,
                color: Provider.of<ResourceApp>(context).ironOreColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(children: [
                        const Text('Iron-ore'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              _incrementCounterIronOre();
                            },
                            child: Text(Provider.of<ResourceApp>(context)
                                .ironOre
                                .toString()),
                          ),
                        )
                      ]),
                    )
                  ],
                ),
              ),
              Container(
                width: 200,
                height: 200,
                color: Provider.of<ResourceApp>(context).copperOreColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(children: [
                        const Text('Copper-ore'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              _incrementCounterCopperOre();
                            },
                            child: Text(Provider.of<ResourceApp>(context)
                                .copperOre
                                .toString()),
                          ),
                        )
                      ]),
                    )
                  ],
                ),
              ),
              Container(
                width: 200,
                height: 200,
                color: Provider.of<ResourceApp>(context).coalColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(children: [
                        const Text('Coal'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              _incrementCounterCoal();
                            },
                            child: Text(Provider.of<ResourceApp>(context)
                                .coal
                                .toString()),
                          ),
                        )
                      ]),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
