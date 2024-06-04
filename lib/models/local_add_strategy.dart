import 'package:flutter/material.dart';
import 'package:xero_app_flutter/models/add_item_strategy.dart';

class LocalAddStrategy extends AddItemStrategy {
  LocalAddStrategy(super.pricing, super.fixedInfo);

  @override
  void add(Map<String, dynamic> data, List<Map<String, dynamic>> lineItems) {
    List<List<dynamic>> sortedStores = _sortStores(data['stores']);
    bool firstStore = true;

    for (final store in sortedStores) {
      final Map<String, dynamic> item =
          _createItemLine(firstStore, store, data);
      firstStore = false;
      lineItems.add(item);
    }
  }

  List<List<dynamic>> _sortStores(List<dynamic> stores) {
    List<List<dynamic>> loads = List.empty(growable: true);

    for (final store in stores) {
      final List<dynamic>? storeInfo = pricing[store];
      if (storeInfo != null) {
        loads.add([store, ...storeInfo]);
      }
    }

    loads.sort((a, b) => a[1].compareTo(b[1]));
    debugPrint(loads.toString());
    return loads;
  }

  Map<String, dynamic> _createItemLine(
    bool first,
    List<dynamic> store,
    Map<String, dynamic> data,
  ) {
    String storeNum = store[0];
    String storeName = store[1];
    int storePrice = store[2];

    return <String, dynamic>{
      'Description': _getDescription(
        first,
        data['manDate'],
        data['manNum'],
        storeNum,
        storeName,
        data['trailNum'],
      ),
      'Quantity': '1',
      'UnitAmount': first ? storePrice.toString() : '50',
      'ItemCode': first ? 'AD-PRIM' : 'DROP-RATE',
      'AccountCode': fixedInfo['CODE'],
    };
  }

  String _getDescription(
    bool first,
    String manDate,
    String storeNum,
    String storeName,
    String manNum,
    String? trailNum,
  ) {
    return '$manDate - $storeNum - ${first ? '$storeName - $manNum' : storeName}${trailNum != null ? ' - $trailNum' : ''}';
  }
}
