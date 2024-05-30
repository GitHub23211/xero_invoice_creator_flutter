import 'package:flutter/material.dart';

class EnteredManifests extends StatelessWidget {
  const EnteredManifests({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: List<Widget>.generate(5, (int index) {
        return Container(
          color: Colors.blue,
          child: const Center(child: Text('Store num, store name, price')),
        );
      }),
    ));
  }
}
