import 'package:xero_app_flutter/models/invoice_strategy.dart';

class LocalStrategy extends InvoiceStrategy {
  LocalStrategy(super.pricing, super.fixedInfo);

  @override
  void processManInfo(Map<String, dynamic> data) {
    List<List<dynamic>> sortedStores = _sortStores(data['stores']);
    bool firstStore = true;

    for (final store in sortedStores) {
      final List<dynamic> item = _createInvoiceItem(firstStore, store, data);
      firstStore = false;
      invoice.addItemLine(item);
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

    loads.sort((a, b) => b[1].compareTo(a[1]));
    return loads;
  }

  List<dynamic> _createInvoiceItem(
    bool first,
    List<dynamic> store,
    Map<String, dynamic> data,
  ) {
    String storeNum = store[0];
    String storeName = store[1];
    int storePrice = store[2];

    return <dynamic>[
      fixedInfo['CONTACT'],
      data['invNum'],
      //reference
      data['issueDate'],
      data['dueDate'],
      first ? 'AD-PRIM' : 'DROP-RATE',
      _getDescription(first, data['manNum'], storeNum, storeName),
      1,
      first ? storePrice : 50,
      fixedInfo['CODE'],
      fixedInfo['TAX']
    ];
  }

  String _getDescription(
    bool first,
    String manNum,
    String storeNum,
    String storeName,
  ) {
    return 'date - $storeNum - ${first ? '$storeName - $manNum' : storeName}';
  }
}
