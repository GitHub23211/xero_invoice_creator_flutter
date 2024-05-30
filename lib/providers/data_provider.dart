import 'package:flutter/material.dart';
import 'package:xero_app_flutter/services/get_files.dart';

class DataProvider extends ChangeNotifier {
  final XeroApi _api = XeroApi();
  Map<String, dynamic> _localPricing = <String, dynamic>{};
  Map<String, dynamic> _fixedInfo = <String, dynamic>{};

  Future<void> fetchFixedInfo() async {
    _fixedInfo = await _api.getFixedInfo();
    notifyListeners();
  }

  Future<void> fetchLocalPricing() async {
    _localPricing = await _api.getLocalStores();
    notifyListeners();
  }

  Map<String, dynamic> getLocalPricing() => _localPricing;
  Map<String, dynamic> getFixedInfo() => _fixedInfo;
}
