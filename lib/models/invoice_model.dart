import 'dart:io';
import 'dart:async';

class InvoiceModel {
  late List<List<dynamic>> _invoice;

  InvoiceModel(List<dynamic> headers) {
    _invoice = [headers];
  }

  void addItemLine(List<dynamic> item) {
    _invoice.add(item);
  }

  Future<void> saveToCSV() async {
    const String filename = './test.csv';
    await File(filename).writeAsString(_convertToCsv());
  }

  String _convertToCsv() {
    return _invoice.join('\n').replaceAll(RegExp(r'\[|\]'), '');
  }
}
