import 'package:flutter/material.dart';
import 'package:game_paper_clic/pages/receipe_page.dart';
import 'package:game_paper_clic/provider/resource_app.dart';
import 'package:provider/provider.dart';

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
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            Provider.of<ResourceApp>(context).inventory.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Aucun inventaire',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: 40),
                    ),
                  )
                : GridView.count(
                    crossAxisCount:
                        Provider.of<ResourceApp>(context).inventory.length,
                    children: const [Text('Test')],
                  ),
          ]),
        ));
  }
}
