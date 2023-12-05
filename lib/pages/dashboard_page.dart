import 'package:flutter/material.dart';
import 'package:game_paper_clic/pages/resource_page.dart';
import 'package:game_paper_clic/provider/resource_app.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.title});
  final String title;
  @override
  State<DashboardPage> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardPage> {
  void _incrementLevel() {
    var listInventoryState = Provider.of<ResourceApp>(context, listen: false);
    listInventoryState.incrementLevel();
  }

  void _navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ResourcePage(title: 'Ressources'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var pourcent = Provider.of<ResourceApp>(context).pourcent;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Image.asset('assets/images/miner.png'),
          onPressed: () {
            _navigate();
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Bienvenue Jean',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
            ),
            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 9.0,
              percent: pourcent,
              center: const Text('Niveau 1'),
              progressColor: Colors.green,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _incrementLevel();
                },
                child: const Text('Voir mon niveau'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
