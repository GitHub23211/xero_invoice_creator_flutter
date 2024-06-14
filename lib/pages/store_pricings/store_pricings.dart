import 'package:flutter/material.dart';
import 'package:xero_app_flutter/global_components/navbar.dart';
import 'package:xero_app_flutter/pages/store_pricings/components/pricing_view.dart';
import 'package:xero_app_flutter/pages/store_pricings/components/search_pricings.dart';

class PricingInfo extends StatefulWidget {
  const PricingInfo({super.key});

  @override
  State<PricingInfo> createState() => _PricingInfoState();
}

class _PricingInfoState extends State<PricingInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        title: 'Store Pricings',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          children: [
            SearchPricings(),
            SizedBox(height: 30.0),
            PricingView(),
          ],
        ),
      ),
    );
  }
}
