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
  @override
  Widget build(BuildContext context) {
    receipes = Provider.of<ResourceApp>(context).receipeList;
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
              children: [
                woodReceipeContainer(context),
                ironOreReceipeContainer(context),
                copperOreReceipeContainer(context),
                coalReceipeContainer(context)
              ],
            ),
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
                              print(receipes[index].resources);
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

  Container coalReceipeContainer(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Provider.of<ResourceApp>(context).coalColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            Provider.of<ResourceApp>(context).coal.name.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            Provider.of<ResourceApp>(context).coal.quantity.toString(),
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Container copperOreReceipeContainer(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Provider.of<ResourceApp>(context).copperOreColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(Provider.of<ResourceApp>(context).copperOre.name.toString()),
          Text(Provider.of<ResourceApp>(context).copperOre.quantity.toString()),
        ],
      ),
    );
  }

  Container ironOreReceipeContainer(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Provider.of<ResourceApp>(context).ironOreColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(Provider.of<ResourceApp>(context).ironOre.name.toString()),
          Text(Provider.of<ResourceApp>(context).ironOre.quantity.toString()),
        ],
      ),
    );
  }

  Container woodReceipeContainer(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Provider.of<ResourceApp>(context).woodColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(Provider.of<ResourceApp>(context).wood.name.toString()),
          Text(Provider.of<ResourceApp>(context).wood.quantity.toString()),
        ],
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
