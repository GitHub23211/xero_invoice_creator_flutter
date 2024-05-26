import 'package:flutter/material.dart';

class EnteredManifests extends StatefulWidget {
  const EnteredManifests({super.key});

  @override
  State<EnteredManifests> createState() => _EnteredManifestsState();
}

class _EnteredManifestsState extends State<EnteredManifests> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: List<Widget>.generate(50, (int index) {
        return Container(
          color: Colors.blue,
          child: const Center(child: Text('Store num, store name, price')),
        );
      }),
    ));
  }
}
