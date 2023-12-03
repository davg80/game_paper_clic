import 'package:flutter/material.dart';
import 'package:game_paper_clic/pages/inventory_page.dart';
import 'package:game_paper_clic/provider/resource_app.dart';
import 'package:provider/provider.dart';

import '../models/receipe.dart';

class ReceipePage extends StatefulWidget {
  const ReceipePage({super.key});

  @override
  State<ReceipePage> createState() => _ReceipePageState();
}

class _ReceipePageState extends State<ReceipePage> {
  List<Receipe> receipes = [];
  void _addInInventoryList(Receipe receipe, List<Resource> resources) {
    var listInventoryState = Provider.of<ResourceApp>(context, listen: false);
    listInventoryState.setInventory(receipe, resources);
  }

  @override
  Widget build(BuildContext context) {
    receipes = Provider.of<ResourceApp>(context).receipeList;
    List<Resource> resources =
        Provider.of<ResourceApp>(context).currentResources;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recettes'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
                children: List.generate(resources.length, (index) {
              return Container(
                width: 100,
                height: 100,
                color: Color(int.parse(resources[index].color!.substring(1, 7),
                        radix: 16) +
                    0xff000000),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resources[index].name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      resources[index].quantity.toString(),
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              );
            })),
          ),
          const ButtonInventoryRedirect(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: receipes.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(receipes[index].name),
                        subtitle: Text(
                          receipes[index].description,
                        ),
                        leading: Image.asset(
                          receipes[index].picture,
                          width: 100,
                          height: 100,
                        ),
                        trailing: Tooltip(
                          message: receipes[index].completed
                              ? 'Produire'
                              : 'En attente...',
                          child: ElevatedButton(
                            onPressed: () {
                              _addInInventoryList(
                                  receipes[index], receipes[index].resources);
                            },
                            child: receipes[index].completed
                                ? const Icon(
                                    Icons.publish_outlined,
                                    color: Colors.lightGreen,
                                  )
                                : const Icon(
                                    Icons.unpublished_outlined,
                                    color: Colors.redAccent,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}

class ButtonInventoryRedirect extends StatelessWidget {
  const ButtonInventoryRedirect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InventoryPage(),
              ),
            );
          },
          child: const Text('Voir mon inventaire'),
        ),
      ),
    );
  }
}
