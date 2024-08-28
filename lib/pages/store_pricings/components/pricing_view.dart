import 'package:flutter/material.dart';
import 'package:xero_app_flutter/pages/store_pricings/components/elements/pricing_list.dart';

class PricingView extends StatelessWidget {
  final Future<List<dynamic>> data;
  const PricingView({
    super.key,
    required this.data,
  });

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
          return PricingList(pricing: snapshot.data!);
        });
  }
}
