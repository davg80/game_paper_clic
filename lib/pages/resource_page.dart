import 'package:flutter/material.dart';
import 'package:game_paper_clic/provider/resource_app.dart';
import 'package:game_paper_clic/receipe_page.dart';
import 'package:provider/provider.dart';

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
          child: Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        height: 200,
                        color: Provider.of<ResourceApp>(context).woodColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Column(children: [
                                Image.asset(
                                  'assets/images/wood.png',
                                  width: 100,
                                  height: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _incrementCounterWood();
                                    },
                                    child: Text(
                                        Provider.of<ResourceApp>(context)
                                            .wood
                                            .toString()),
                                  ),
                                )
                              ]),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        height: 200,
                        color: Provider.of<ResourceApp>(context).ironOreColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Column(children: [
                                Image.asset(
                                  'assets/images/iron-ore.png',
                                  width: 100,
                                  height: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _incrementCounterIronOre();
                                    },
                                    child: Text(
                                        Provider.of<ResourceApp>(context)
                                            .ironOre
                                            .toString()),
                                  ),
                                )
                              ]),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        height: 200,
                        color: Provider.of<ResourceApp>(context).copperOreColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Column(children: [
                                Image.asset(
                                  'assets/images/copper-ore.png',
                                  width: 100,
                                  height: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _incrementCounterCopperOre();
                                    },
                                    child: Text(
                                        Provider.of<ResourceApp>(context)
                                            .copperOre
                                            .toString()),
                                  ),
                                )
                              ]),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        height: 200,
                        color: Provider.of<ResourceApp>(context).coalColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Column(children: [
                                Image.asset(
                                  'assets/images/coal.png',
                                  width: 100,
                                  height: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _incrementCounterCoal();
                                    },
                                    child: Text(
                                        Provider.of<ResourceApp>(context)
                                            .coal
                                            .toString()),
                                  ),
                                )
                              ]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  transform: Matrix4.translationValues(
                      0.0, -(MediaQuery.of(context).size.height / 3), 0.0),
                  child: Text(
                      'Total ${Provider.of<ResourceApp>(context).getTotal()}'))
            ],
          ),
        ),
      ),
    );
  }
}
