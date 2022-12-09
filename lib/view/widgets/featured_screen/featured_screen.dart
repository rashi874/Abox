import 'package:abox/view/widgets/screehome/const.dart';
import 'package:flutter/material.dart';

class FeaturedScreen extends StatelessWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Featured images',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: Color.fromARGB(255, 12, 12, 12),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              kbox20,
              kbox20,
              const Center(
                child: Text(
                  'New Features Coming soon',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              kbox10,
              Image.asset(
                bck,
                // height: 50,
              ),
            ],
          ),
        ));
  }
}
