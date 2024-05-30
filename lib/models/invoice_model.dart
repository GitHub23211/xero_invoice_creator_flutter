import 'package:flutter/material.dart';

class InvoiceModel {
  late List<List<dynamic>> _csv;

  InvoiceModel(List<dynamic> headers) {
    _csv = [headers];
  }

  void addLocalManifest(List<dynamic> row) {
    _csv.add(row);
  }
}
