import 'package:abox/view/widgets/horizontal_view/horizontal_temp.dart';
import 'package:abox/view/widgets/vertical_view/vertical_temp.dart';
import 'package:flutter/material.dart';

class Tabscreen extends StatelessWidget {
  const Tabscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          
          bottom: const TabBar(
            tabs: [
              Tab(child: Text('Horizontal')),
              Tab(child: Text('Vertical')),
            ],
          ),
          title: const Text('Templates'),
        ),
        body: const TabBarView(
          children: [
            NewModel(),
            VerticleTemplates(),
          ],
        ),
      ),
    );
  }
}
