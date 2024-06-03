import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xero_app_flutter/models/save_strategy.dart';

class CsvStrategy implements SaveStrategy {
  final List<List<dynamic>> _csv = <List>[];
  late final List<dynamic> _headers;
  late String _reference;

  CsvStrategy(List<dynamic> headers) {
    _headers = headers;
  }

  @override
  Future<void> save(Map<String, dynamic> invoice) async {
    _resetCsv();
    const String filename = './test.csv';
    _reference = 'test';
    await File(filename).writeAsString(_convertToCsv(invoice));
  }

  String _convertToCsv(Map<String, dynamic> invoice) {
    for (final item in invoice['LineItems']) {
      _csv.add(_convertLineItems(invoice, item));
    }

    return _csv.join('\n').replaceAll(RegExp(r'\[|\]'), '');
  }

  /*
    "*ContactName",
  "*InvoiceNumber",
  "Reference",
  "*InvoiceDate",
  "*DueDate",
  "InventoryItemCode",
  "*Description",
  "*Quantity",
  "*UnitAmount",
  "*AccountCode",
  "*TaxType"
  */
  List<String> _convertLineItems(
      Map<String, dynamic> invoice, Map<String, dynamic> lineItems) {
    return [
      invoice['Contact'],
      invoice['InvoiceNumber'],
      _reference,
      invoice['Date'],
      invoice['DueDate'],
      lineItems['ItemCode'],
      lineItems['Description'],
      lineItems['Quantity'],
      lineItems['UnitAmount'],
      lineItems['AccountCode'],
    ];
  }

  void _resetCsv() {
    _csv.clear();
    _csv.add(_headers);
  }
}
