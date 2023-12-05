import 'package:flutter/material.dart';
import 'package:game_paper_clic/models/receipe.dart';
import 'package:game_paper_clic/provider/resource_app.dart';
import 'package:game_paper_clic/pages/receipe_page.dart';
import 'package:provider/provider.dart';

class ResourcePage extends StatefulWidget {
  const ResourcePage({super.key, required this.title});
  final String title;
  @override
  State<ResourcePage> createState() => _ResourceState();
}

class _ResourceState extends State<ResourcePage> {
  void _incrementCounter(index) {
    var appStateWood = Provider.of<ResourceApp>(context, listen: false);
    appStateWood.increment(index);
  }

  void _navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ReceipePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ResourceApp>(context).setReceipeList();
    List<Resource> resources =
        Provider.of<ResourceApp>(context).currentResources;
    // print('RESOURCES $resources');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Image.asset('assets/images/money.gif'),
          onPressed: () {
            _navigate();
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount:
                    Provider.of<ResourceApp>(context).currentResources.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    height: 200,
                    color: Color(int.parse(
                            resources[index].color!.substring(1, 7),
                            radix: 16) +
                        0xff000000),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Center(
                            child: Column(children: [
                              Image.asset(
                                resources[index].picture!,
                                width: 30,
                                height: 30,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _incrementCounter(index);
                                },
                                child:
                                    Text(resources[index].quantity.toString()),
                              )
                            ]),
                          ),
                        )
                      ],
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                ),
              ),
            ),
            containerTotalResource(context)
          ],
        ),
      ),
    );
  }

  Container containerTotalResource(BuildContext context) {
    return Container(
        color: Colors.deepOrangeAccent,
        transform: Matrix4.translationValues(
            0.0, -(MediaQuery.of(context).size.height / 3), 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/money.gif',
              width: 100,
              height: 100,
            ),
            Text('Total ${Provider.of<ResourceApp>(context).getTotal()}'),
          ],
        ));
  }
}
