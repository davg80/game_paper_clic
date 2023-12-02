import 'package:flutter/material.dart';
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
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(snapshot.data[index].name),
                              subtitle: Text(
                                snapshot.data[index].description,
                              ),
                              leading: Image.asset(
                                snapshot.data[index].picture,
                                width: 100,
                                height: 100,
                              ),
                              trailing: ElevatedButton(
                                onPressed: () {},
                                child: snapshot.data[index].completed
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
            )
          ],
        ),
      ),
    );
  }
}
