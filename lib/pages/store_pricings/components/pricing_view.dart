import 'package:flutter/material.dart';
import 'package:xero_app_flutter/pages/store_pricings/components/elements/store_info_tile.dart';

class PricingView extends StatelessWidget {
  final Future<List<dynamic>> data;
  const PricingView({
    super.key,
    required this.data,
  });

  Widget _createPricingList(List<dynamic> pricing) => Expanded(
        child: ListView(
          children: List<Widget>.generate(
            pricing.length,
            (int i) => StoreInfoTile(
              storeInfo: pricing[i],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: data,
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return _createPricingList(snapshot.data!);
        });
  }
}
