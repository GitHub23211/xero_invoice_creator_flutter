import 'package:flutter/material.dart';
import 'package:xero_app_flutter/services/get_files.dart';

class DataController extends ChangeNotifier {
  final XeroApi _api = XeroApi();
  Map<String, dynamic> _localPricing = <String, dynamic>{};
  Map<String, dynamic> _fixedInfo = <String, dynamic>{};

  Future<void> fetchFixedInfo() async {
    _fixedInfo = await _api.getFixedInfo();
  }

  Future<void> fetchLocalPricing() async {
    _localPricing = await _api.getLocalStores();
  }

  Future<void> updateLocalPricing({
    required String oldStoreNum,
    required String newStoreNum,
    required String storeName,
    required int storePricing,
  }) async {
    if (oldStoreNum == newStoreNum) {
      _localPricing[oldStoreNum] = [
        storeName,
        storePricing,
      ];
    } else if (_localPricing.containsKey(newStoreNum)) {
      debugPrint('key already exists');
    } else {
      _localPricing.remove(oldStoreNum);
      _localPricing[newStoreNum] = [
        storeName,
        storePricing,
      ];
    }
    await _api.updateLocalStores(_localPricing);
    notifyListeners();
  }

  Future<void> deleteLocalPricing(String oldStoreNum) async {
    _localPricing.remove(oldStoreNum);
    await _api.updateLocalStores(_localPricing);
    notifyListeners();
  }

  Map<String, dynamic> getLocalPricing() => _localPricing;
  Map<String, dynamic> getFixedInfo() => _fixedInfo;
}
