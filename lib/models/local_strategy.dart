import 'package:flutter/material.dart';
import 'package:xero_app_flutter/models/invoice_strategy.dart';

class LocalStrategy extends InvoiceStrategy {
  LocalStrategy(super.pricing, super.fixedInfo);

  @override
  void processManInfo(Map<String, dynamic> data) {
    List<List<dynamic>> sortedStores = _sortStores(data['stores']);

    for (final store in sortedStores) {
      final List<dynamic> item = <dynamic>[
        fixedInfo['CONTACT'],
        data['invNum'],
        //refernce
        data['issueDate'],
        data['dueDate'],
        store[0],
        _getDescription(),
        1,
        store[1],
        fixedInfo['CODE'],
        fixedInfo['TAX']
      ];

      debugPrint(item.toString());
    }
  }

  List<List<dynamic>> _sortStores(List<dynamic> stores) {
    List<List<dynamic>> unsorted = List.empty(growable: true);

    for (final store in stores) {
      final List<dynamic>? price = pricing[store];
      if (price != null) {
        unsorted.add(price);
      }
    }

    unsorted.sort((a, b) => b[1].compareTo(a[1]));
    return unsorted;
  }

  String _getDescription() {
    return 'test';
  }
}
