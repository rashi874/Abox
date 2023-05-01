import 'package:abox/view/widgets/horizontal_view/horizontal_temp.dart';
import 'package:abox/view/widgets/vertical_view/vertical_temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Tabscreen extends StatelessWidget {
  const Tabscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          
          bottom: TabBar(
            tabs: [
              Tab(child: Text('Horizontal')),
              Tab(child: Text('Vertical')),
            ],
          ),
          title: Text('Templates'),
        ),
        body: TabBarView(
          children: [
            const NewModel(),
            const VerticleTemplates(),
          ],
        ),
      ),
    );
  }
}
