import 'package:flutter/material.dart';

class InvoiceModel {
  final List<List<String>> _csv = List.empty();

  void addManifest(String? storeNum) {
    debugPrint(storeNum);
  }
}
