import 'package:xero_app_flutter/models/add_item_strategy/add_item_strategy.dart';

class LocalAddStrategy implements AddItemStrategy {
  late final Map<String, dynamic> _pricing;
  late final Map<String, dynamic> _fixedInfo;

  LocalAddStrategy(
    Map<String, dynamic> p,
    Map<String, dynamic> f,
  ) {
    _pricing = p;
    _fixedInfo = f;
  }

  @override
  bool isValidStoreNum(String storeNum) => _pricing.containsKey(storeNum);

  @override
  void add(Map<String, dynamic> data, List<Map<String, dynamic>> lineItems) {
    List<List<dynamic>> sortedStores = _sortStores(data['stores']);
    bool firstStore = true;

    for (final store in sortedStores) {
      late final Map<String, dynamic> item;
      if (store.contains("ALLWNCE")) {
        item = _createAllowanceLineItem(store, data);
      } else {
        item = _createLineItem(firstStore, store, data);
      }

      firstStore = false;
      lineItems.add(item);
    }
  }

  List<List<dynamic>> _sortStores(List<dynamic> stores) {
    List<List<dynamic>> loads = <List>[];

    for (final store in stores) {
      final List<dynamic>? storeInfo = _pricing[store];
      if (storeInfo != null) {
        loads.add([store, ...storeInfo]);
      }
    }

    loads.sort((a, b) => b[2].compareTo(a[2]));
    return loads;
  }

  Map<String, dynamic> _createLineItem(
    bool first,
    List<dynamic> store,
    Map<String, dynamic> data,
  ) {
    String storeNum = store[0];
    String storeName = store[1];
    double storePrice = store[2].toDouble();

    return <String, dynamic>{
      'ManNum': data['manNum'],
      'ManDate': data['manDate'],
      'Description': _getDescription(
        first,
        data['manDate'],
        storeNum,
        storeName,
        data['manNum'],
        data['trailNum'],
      ),
      'Quantity': '1',
      'UnitAmount': first ? storePrice.toString() : '50',
      'ItemCode': first ? 'AD-PRIM' : 'DROP-RATE',
      'AccountCode': _fixedInfo['CODE'],
    };
  }

  String _getDescription(
    bool first,
    String manDate,
    String storeNum,
    String storeName,
    String manNum,
    String trailNum,
  ) {
    return '$manDate - $storeNum - ${first ? '$storeName - $manNum' : storeName}${trailNum.isNotEmpty ? ' - $trailNum' : ''}';
  }

  Map<String, dynamic> _createAllowanceLineItem(
    List<dynamic> store,
    Map<String, dynamic> data,
  ) {
    String storeNum = store[0];
    String storeName = store[1];
    double storePrice = store[2].toDouble();

    return <String, dynamic>{
      'ManNum': data['manNum'],
      'ManDate': data['manDate'],
      'Description': storeName,
      'Quantity': '1',
      'UnitAmount': storePrice.toString(),
      'ItemCode': storeNum,
      'AccountCode': _fixedInfo['CODE'],
    };
  }
}
