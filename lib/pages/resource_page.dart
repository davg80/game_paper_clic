import 'package:flutter/material.dart';
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
      context,
      MaterialPageRoute(
        builder: (context) => const ReceipePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              child: GridView.count(
                crossAxisCount: 4,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width / 400),
                    child: containerWood(context),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width / 400),
                    child: containerIronOre(context),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width / 400),
                    child: containerCopperOre(context),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width / 400),
                    child: containerCoal(context),
                  ),
                ],
              ),
            ),
            containerTotalResource(context)
          ],
        ),
      ),
    );
  }

  Container containerCoal(BuildContext context) {
    return Container(
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
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width / 400),
                child: ElevatedButton(
                  onPressed: () {
                    _incrementCounterCoal();
                  },
                  child: Text(Provider.of<ResourceApp>(context)
                      .coal
                      .quantity
                      .toString()),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  Container containerCopperOre(BuildContext context) {
    return Container(
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
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height / 400),
                child: ElevatedButton(
                  onPressed: () {
                    _incrementCounterCopperOre();
                  },
                  child: Text(Provider.of<ResourceApp>(context)
                      .copperOre
                      .quantity
                      .toString()),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  Container containerIronOre(BuildContext context) {
    return Container(
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
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height / 400),
                child: ElevatedButton(
                  onPressed: () {
                    _incrementCounterIronOre();
                  },
                  child: Text(Provider.of<ResourceApp>(context)
                      .ironOre
                      .quantity
                      .toString()),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  Container containerWood(BuildContext context) {
    return Container(
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
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height / 400),
                child: ElevatedButton(
                  onPressed: () {
                    _incrementCounterWood();
                  },
                  child: Text(Provider.of<ResourceApp>(context)
                      .wood
                      .quantity
                      .toString()),
                ),
              )
            ]),
          )
        ],
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
