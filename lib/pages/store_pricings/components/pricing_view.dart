import 'package:flutter/material.dart';

class PricingView extends StatelessWidget {
  final Future<List<dynamic>> Function() getData;
  const PricingView({
    super.key,
    required this.getData,
  });

  Widget _createPricingList(List<dynamic> pricing) => Expanded(
        child: ListView(
          children: List<Widget>.generate(
            pricing.length,
            (int i) => Container(
              width: 100,
              height: 30,
              child: Text(
                pricing[i].toString(),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
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
