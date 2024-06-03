import 'package:flutter/material.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/elements/man_list_tile.dart';

class EnteredManifests extends StatefulWidget {
  final List<Map<String, dynamic>> lineItems;
  const EnteredManifests({
    super.key,
    required this.lineItems,
  });

  @override
  State<EnteredManifests> createState() => _EnteredManifestsState();
}

class _EnteredManifestsState extends State<EnteredManifests> {
  void _deleteItemLine(int index) {
    setState(() => widget.lineItems.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: List<Widget>.generate(2, (int index) {
        // return ManListTile(
        //   onTap: () => _deleteItemLine(index),
        //   itemLine: widget.lineItems[index + 1],
        // );
        return Container(
          color: Colors.black,
        );
      }),
    ));
  }
}
