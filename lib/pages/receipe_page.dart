import 'package:flutter/material.dart';
import 'package:game_paper_clic/models/receipe.dart';
import 'package:game_paper_clic/pages/inventory_page.dart';
import 'package:game_paper_clic/provider/resource_app.dart';
import 'package:provider/provider.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20.0),
              child: Wrap(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Provider.of<ResourceApp>(context).woodColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(Provider.of<ResourceApp>(context)
                            .wood
                            .name
                            .toString()),
                        Text(Provider.of<ResourceApp>(context)
                            .wood
                            .quantity
                            .toString()),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Provider.of<ResourceApp>(context).ironOreColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(Provider.of<ResourceApp>(context)
                            .ironOre
                            .name
                            .toString()),
                        Text(Provider.of<ResourceApp>(context)
                            .ironOre
                            .quantity
                            .toString()),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Provider.of<ResourceApp>(context).copperOreColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(Provider.of<ResourceApp>(context)
                            .copperOre
                            .name
                            .toString()),
                        Text(Provider.of<ResourceApp>(context)
                            .copperOre
                            .quantity
                            .toString()),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Provider.of<ResourceApp>(context).coalColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          Provider.of<ResourceApp>(context)
                              .coal
                              .name
                              .toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          Provider.of<ResourceApp>(context)
                              .coal
                              .quantity
                              .toString(),
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Center(
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
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder(
                future: Provider.of<ResourceApp>(context).loadData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Text(
                          'Une erreur est survenue lors du chargement des données.');
                    } else if (snapshot.hasData) {
                      final receipesList = snapshot.data;
                      return ListView.builder(
                        itemCount: receipesList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(receipesList[index].name),
                                  subtitle: Text(
                                    receipesList[index].description,
                                  ),
                                  leading: Image.asset(
                                    receipesList[index].picture,
                                    width: 100,
                                    height: 100,
                                  ),
                                  trailing: Tooltip(
                                    message: receipesList[index].completed
                                        ? 'Produire'
                                        : 'En attente...',
                                    child: ElevatedButton(
                                      onPressed: () {
                                        print(receipesList[index].resources);
                                      },
                                      child: receipesList[index].completed
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
                                SizedBox(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                      itemCount:
                                          receipesList[index].resources.length,
                                      itemBuilder: (context, i) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 28.0),
                                          child: RichText(
                                            text: TextSpan(
                                                text: receipesList[index]
                                                    .resources[i]
                                                    .name,
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  const TextSpan(
                                                      text: ' : ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  TextSpan(
                                                      text: receipesList[index]
                                                          .resources[i]
                                                          .quantity
                                                          .toString())
                                                ]),
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return const Text('Aucune donnée disponible.');
                    }
                  } else {
                    return Text('State: ${snapshot.connectionState}');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
