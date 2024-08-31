import 'package:xero_app_flutter/models/add_item_strategy/add_item_strategy.dart';
import 'package:xero_app_flutter/models/save_strategy/save_strategy.dart';

class InvoiceModel {
  late final Map<String, dynamic> _invoice;
  late SaveStrategy _save;
  late AddItemStrategy _strat;

  /// _invoice Map structure per the Xero API POST Invoices specifications
  /// ManNums not part of spec. Added to keep track of manifest numbers
  InvoiceModel(SaveStrategy s, AddItemStrategy a, String c) {
    _save = s;
    _strat = a;
    _invoice = {
      'Type': 'ACCREC',
      'Contact': c,
      'Date': null,
      'DueDate': null,
      'InvoiceNumber': null,
      'Reference': null,
      'CurrencyCode': 'AUD',
      'Status': 'DRAFT',
      'LineItems': <Map<String, dynamic>>[],
      'ManNums': <String>{},
    };
  }

  List<Map<String, dynamic>> getItems() => _invoice['LineItems'];

  String getStartDate() => _invoice['Date'];

  String getInfo() =>
      'Invoice Number - ${_invoice['InvoiceNumber']}, Date - ${_invoice['Date']}, Due Date - ${_invoice['DueDate']}';

  void updateManNums(String num) => _invoice['ManNums'].add(num);

  bool _manNumExists(String num) => _invoice['ManNums'].contains(num);

  void setInvoiceInfo(String date, String due, String num) {
    _invoice['Date'] = date;
    _invoice['DueDate'] = due;
    _invoice['InvoiceNumber'] = num;
  }

  bool isValidStoreNum(String storeNum) => _strat.isValidStoreNum(storeNum);

  void addLineItem(Map<String, dynamic> data) {
    if (!_manNumExists(data['manNum'])) {
      _strat.add(data, getItems());
    }
  }

  void deleteLineItem(int index) {
    String manNum = _invoice['LineItems'].removeAt(index)['ManNum'];
    _invoice['ManNums'].remove(manNum);
    _invoice['LineItems'] = _invoice['LineItems']
        .where((item) => item['ManNum'] != manNum)
        .toList();
  }

  void save() {
    _save.save(_invoice);
  }
}
