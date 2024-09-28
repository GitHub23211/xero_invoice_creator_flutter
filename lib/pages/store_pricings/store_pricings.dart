import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xero_app_flutter/global_components/navbar.dart';
import 'package:xero_app_flutter/pages/store_pricings/components/add_store_view.dart';
import 'package:xero_app_flutter/pages/store_pricings/components/pricing_view.dart';
import 'package:xero_app_flutter/pages/store_pricings/components/search_pricings.dart';
import 'package:xero_app_flutter/controllers/data_controller.dart';

class StorePricings extends StatefulWidget {
  const StorePricings({super.key});

  @override
  State<StorePricings> createState() => _StorePricingsState();
}

class _StorePricingsState extends State<StorePricings> {
  final TextEditingController _searchText = TextEditingController();
  final TextEditingController _storeNum = TextEditingController();
  final TextEditingController _storeName = TextEditingController();
  final TextEditingController _storePricing = TextEditingController();
  late List<dynamic> _pricing = <dynamic>[];
  int _searchTextLength = 0;

  @override
  void initState() {
    super.initState();
    _searchText.addListener(_onChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _searchText.removeListener(_onChanged);
    _searchText.dispose();
    _storeNum.dispose();
    _storeName.dispose();
    _storePricing.dispose();
  }

  void _onClear() {
    _searchText.text = '';
  }

  void _onChanged() {
    setState(() {
      _search();
    });
  }

  void _search() {
    String s = _searchText.text;
    if (s.length < _searchTextLength) {
      _resetData();
    }
    _filterList(s);
    _searchTextLength = s.length;
  }

  void _resetData() {
    Map<String, dynamic> data =
        context.read<DataController>().getLocalPricing();
    _pricing = data.keys.map((k) {
      dynamic temp = data[k].toList();
      temp.add(k);
      return temp;
    }).toList();
    _pricing.removeAt(0);
    _pricing.sort((a, b) => int.parse(a[2]) - int.parse(b[2]));
  }

  void _filterList(String s) {
    _pricing = _pricing
        .where((element) => element[0].toUpperCase().contains(s.toUpperCase()))
        .toList();
  }

  Future<void> _fetchData() async {
    DataController data = context.watch<DataController>();
    await data.fetchLocalPricing();
    _resetData();
  }

  Future<List<dynamic>> _getData() async {
    await _fetchData();
    _search();
    return _pricing;
  }

  void addNewStore() {
    context.read<DataController>().updateLocalPricing(
          oldStoreNum: _storeNum.text,
          newStoreNum: _storeNum.text,
          storeName: _storeName.text,
          storePricing: int.parse(_storePricing.text),
        );
  }

  Future<void> _addStoreUI() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AddStoreView(
        storeNum: _storeNum,
        storeName: _storeName,
        storePricing: _storePricing,
        onAdd: addNewStore,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(
        title: 'Store Pricings',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          children: [
            SearchPricings(
              searchText: _searchText,
              onClear: _onClear,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _addStoreUI,
              child: const Text('Add New Store'),
            ),
            const SizedBox(height: 10.0),
            PricingView(
              data: _getData(),
            ),
          ],
        ),
      ),
    );
  }
}
