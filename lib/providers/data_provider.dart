import 'package:flutter/material.dart';
import 'package:xero_app_flutter/models/invoice_model.dart';
import 'package:xero_app_flutter/services/get_files.dart';

class DataProvider extends ChangeNotifier {
  final XeroApi _api = XeroApi();
  final InvoiceModel _invoice = InvoiceModel();
  Map<String, dynamic> _localPricing = <String, dynamic>{};

  Future<void> fetchLocalPricing() async {
    _localPricing = await _api.getLocalStores();
    notifyListeners();
  }

  Map<String, dynamic> getLocalPricing() => _localPricing;

  void addManifest(String? storeNum) {
    if (storeNum!.isNotEmpty) _invoice.addManifest(storeNum);
  }
}
