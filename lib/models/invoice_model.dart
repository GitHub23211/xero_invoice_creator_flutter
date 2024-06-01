import 'package:flutter/material.dart';

class InvoiceModel {
  late List<List<dynamic>> _csv;

  InvoiceModel(List<dynamic> headers) {
    _csv = [headers];
  }

  void addManifest(List<dynamic> item) {
    debugPrint(item.toString());
  }

  List<String> formatLocal(Map<String, dynamic> data) {
    List<String> rowToAdd = <String>[];

    return rowToAdd;
  }
}
