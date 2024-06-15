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
    String s = _searchText.text;
    if (s.isEmpty) {
      setState(() {
        _initialLoad = true;
      });
    } else {
      setState(() {
        _pricing = _filterList(s);
      });
    }
  }

  List<dynamic> _filterList(String? s) {
    Iterable<dynamic> filtered = _pricing.where((element) {
      return element[0].contains(s!.toUpperCase());
    });
    return filtered.toList();
  }

  Future<List<dynamic>> _getData() async {
    if (_initialLoad) {
      DataProvider provider = context.read<DataProvider>();
      await provider.fetchLocalPricing();
      Map<String, dynamic> data = provider.getLocalPricing();
      _pricing = data.keys.map((k) {
        data[k].add(k);
        return data[k];
      }).toList();

      _initialLoad = false;
    }
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
