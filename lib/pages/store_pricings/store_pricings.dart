import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xero_app_flutter/global_components/navbar.dart';
import 'package:xero_app_flutter/pages/store_pricings/components/pricing_view.dart';
import 'package:xero_app_flutter/pages/store_pricings/components/search_pricings.dart';
import 'package:xero_app_flutter/providers/data_provider.dart';

class PricingInfo extends StatefulWidget {
  const PricingInfo({super.key});

  @override
  State<PricingInfo> createState() => _PricingInfoState();
}

class _PricingInfoState extends State<PricingInfo> {
  late final TextEditingController _searchText;
  late List<dynamic> _pricing = <dynamic>[];
  bool _initialLoad = true;
  int _searchTextLength = 0;

  @override
  void initState() {
    super.initState();
    _searchText = TextEditingController();
    _searchText.addListener(_onChanged);
  }

  void _onClear() {
    _searchText.text = '';
  }

  void _onChanged() {
    setState(() {
      String s = _searchText.text;
      if (s.length < _searchTextLength) {
        _resetData();
      }
      _filterList(s);
      _searchTextLength = _searchText.text.length;
    });
  }

  void _resetData() {
    Map<String, dynamic> data = context.read<DataProvider>().getLocalPricing();
    _pricing = data.keys.map((k) {
      data[k].add(k);
      return data[k];
    }).toList();
    _pricing.removeAt(0);
  }

  void _filterList(String? s) {
    Iterable<dynamic> filtered = _pricing.where((element) {
      return element[0].contains(s!.toUpperCase());
    });
    _pricing = filtered.toList();
  }

  Future<void> _fetchData() async {
    DataProvider provider = context.read<DataProvider>();
    await provider.fetchLocalPricing();
    _initialLoad = false;
    _resetData();
  }

  Future<List<dynamic>> _getData() async {
    if (_initialLoad) await _fetchData();
    return _pricing;
  }

  @override
  void dispose() {
    super.dispose();
    _searchText.dispose();
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
            const SizedBox(height: 30.0),
            PricingView(
              data: _getData(),
            ),
          ],
        ),
      ),
    );
  }
}
