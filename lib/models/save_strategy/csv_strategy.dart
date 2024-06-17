import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:xero_app_flutter/models/save_strategy/save_strategy.dart';

class CsvStrategy implements SaveStrategy {
  final List<List<dynamic>> _csv = <List>[];
  late final List<dynamic> _headers;
  DateTime? _firstDate;
  DateTime? _latestDate;

  CsvStrategy(List<dynamic> headers) {
    _headers = headers;
  }

  @override
  Future<void> save(Map<String, dynamic> invoice) async {
    final String? filename = await FilePicker.platform.saveFile(
      fileName: '${invoice['InvoiceNumber']}.csv',
    );
    if (filename != null) {
      _resetCsv();
      await File(filename).writeAsString(_convertToCsv(invoice));
    }
  }

  String _convertToCsv(Map<String, dynamic> invoice) {
    for (final item in invoice['LineItems']) {
      _csv.add(_convertLineItem(invoice, item));
    }

    for (final line in _csv) {
      line.insert(2, _createLocalReference());
    }

    return _csv.join('\n').replaceAll(RegExp(r'\[|\]'), '');
  }

  /*
    "*ContactName",
  "*InvoiceNumber",
  "Reference",
  "*InvoiceDate",
  "*DueDate",
  "InventoryItemCode",
  "*Description",
  "*Quantity",
  "*UnitAmount",
  "*AccountCode",
  "*TaxType"
  */
  List<String> _convertLineItem(
      Map<String, dynamic> invoice, Map<String, dynamic> lineItem) {
    _updateDates(lineItem['ManDate']);
    return [
      invoice['Contact'],
      invoice['InvoiceNumber'],
      // reference
      invoice['Date'],
      invoice['DueDate'],
      lineItem['ItemCode'],
      lineItem['Description'],
      lineItem['Quantity'],
      lineItem['UnitAmount'],
      lineItem['AccountCode'],
    ];
  }

  void _updateDates(String date) {
    final DateFormat formatter = DateFormat('dd/MM/yy');
    DateTime current = formatter.parse(date);

    if (_latestDate == null) {
      _latestDate = current;
    } else if (current.isAfter(_latestDate!)) {
      _latestDate = current;
    }

    if (_firstDate == null) {
      _firstDate = current;
    } else if (current.isBefore(_firstDate!)) {
      _firstDate = current;
    }
  }

  String _createLocalReference() {
    final DateFormat formatter = DateFormat('dd/MM/yy');
    return 'LOCAL: ${formatter.format(_firstDate!)} - ${formatter.format(_latestDate!)}';
  }

  void _resetCsv() {
    _csv.clear();
    _firstDate = null;
    _latestDate = null;
    _csv.add(_headers);
  }
}
