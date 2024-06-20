import 'package:flutter/material.dart';
import 'package:xero_app_flutter/pages/store_pricings/components/elements/store_info_tile.dart';

class PricingView extends StatefulWidget {
  final Future<List<dynamic>> data;
  const PricingView({
    super.key,
    required this.data,
  });

  @override
  State<PricingView> createState() => _PricingViewState();
}

class _PricingViewState extends State<PricingView> {
  List<dynamic> _pricing = <dynamic>[];

  void _deleteStore(int index) {
    setState(() {
      _pricing.removeAt(index);
    });
  }

  Widget _createPricingList() => Expanded(
        child: ListView.separated(
          itemBuilder: (_, int index) {
            return StoreInfoTile(
              storeInfo: _pricing[index],
              //deleteStore: () => _deleteStore(i),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: _pricing.length,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.data,
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          _pricing = snapshot.data!;
          return _createPricingList();
        });
  }
}
