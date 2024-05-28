import 'dart:io';
import 'dart:async';
import 'dart:convert';

class XeroApi {
  XeroApi._internal();
  final String _url = '../data/database';

  static final XeroApi _instance = XeroApi._internal();
  factory XeroApi() => _instance;

  Future<Map<String, dynamic>> getLocalStores() async {
    Map<String, dynamic> json =
        jsonDecode(await File('$_url/local_pricing.json').readAsString());
    return json;
  }
}
