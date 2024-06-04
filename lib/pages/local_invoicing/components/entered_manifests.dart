import 'package:flutter/material.dart';
import 'package:xero_app_flutter/models/invoice_model.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/elements/man_list_tile.dart';

class EnteredManifests extends StatefulWidget {
  final InvoiceModel invoice;

  const EnteredManifests({
    super.key,
    required this.invoice,
  });

  @override
  State<EnteredManifests> createState() => _EnteredManifestsState();
}

class _EnteredManifestsState extends State<EnteredManifests> {
  void _deleteItemLine(int index) {
    setState(() => widget.invoice.deleteLineItem(index));
  }

  @override
  Widget build(BuildContext context) {
    late final List<Map<String, dynamic>> lineItems = widget.invoice.getItems();
    return Expanded(
        child: ListView(
      children: List<Widget>.generate(lineItems.length, (int index) {
        return ManListTile(
          onTap: () => _deleteItemLine(index),
          itemLine: lineItems[index],
        );
        return Container(
          color: Colors.black,
        );
      }),
    ));
  }
}
