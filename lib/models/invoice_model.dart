import 'package:flutter/material.dart';
import 'package:xero_app_flutter/models/csv_strategy.dart';
import 'package:xero_app_flutter/models/add_item_strategy.dart';
import 'package:xero_app_flutter/models/local_add_strategy.dart';
import 'package:xero_app_flutter/models/save_strategy.dart';

class InvoiceModel {
  late final Map<String, dynamic> _invoice;
  late SaveStrategy _save;
  late AddItemStrategy _strat;

  /// _invoice Map structure per the Xero API POST Invoices specifications
  InvoiceModel(
    Map<String, dynamic> p,
    Map<String, dynamic> f,
  ) {
    _save = CsvStrategy(f['HEADERS']);
    _strat = LocalAddStrategy(p, f);
    _invoice = {
      'Type': 'ACCREC',
      'Contact': f['CONTACT'],
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

  String getInfo() =>
      'Invoice Number - ${_invoice['InvoiceNumber']}, Date - ${_invoice['Date']}, Due Date - ${_invoice['DueDate']}';

  void updateManNums(String num) => _invoice['ManNums'].add(num);

  bool _manNumExists(String num) => _invoice['ManNums'].contains(num);

  void setInvoiceInfo(String date, String due, String num) {
    _invoice['Date'] = date;
    _invoice['DueDate'] = due;
    _invoice['InvoiceNumber'] = num;
    debugPrint(_invoice.toString());
  }

  void addLineItem(Map<String, dynamic> data) {
    if (!_manNumExists(data['manNum'])) {
      _strat.add(data, getItems());
    }
  }

  void save() {
    _save.save(_invoice);
  }
}
