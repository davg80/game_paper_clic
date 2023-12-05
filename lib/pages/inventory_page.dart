import 'package:flutter/material.dart';
import 'package:game_paper_clic/pages/receipe_page.dart';
import 'package:game_paper_clic/provider/resource_app.dart';
import 'package:provider/provider.dart';

import '../models/receipe.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  void _navigate() {
    Navigator.pop(
        context, MaterialPageRoute(builder: (context) => const ReceipePage()));
  }

  @override
  Widget build(BuildContext context) {
    List<Receipe> inventoryList = Provider.of<ResourceApp>(context).inventory;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventaire'),
        leading: IconButton(
          icon: const Icon(Icons.inventory_2_outlined),
          onPressed: () {
            _navigate();
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: inventoryList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(inventoryList[index].name),
                          subtitle: Text(
                            inventoryList[index].description,
                          ),
                          leading: Image.asset(
                            inventoryList[index].picture,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
