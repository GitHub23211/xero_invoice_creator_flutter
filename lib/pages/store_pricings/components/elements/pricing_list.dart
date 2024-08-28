import 'package:flutter/material.dart';
import 'package:xero_app_flutter/pages/store_pricings/components/elements/store_info_tile.dart';

class PricingList extends StatelessWidget {
  final List<dynamic> pricing;
  const PricingList({
    super.key,
    required this.pricing,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (_, int index) {
          final TextEditingController storeNum =
              TextEditingController(text: pricing[index][2]);
          final TextEditingController storeName =
              TextEditingController(text: pricing[index][0]);
          final TextEditingController storePricing =
              TextEditingController(text: pricing[index][1].toString());

          return StoreInfoTile(
            initialStoreNum: pricing[index][2],
            storeNum: storeNum,
            storeName: storeName,
            storePricing: storePricing,
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: pricing.length,
      ),
    );
  }
}
