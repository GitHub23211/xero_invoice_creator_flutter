import 'dart:math';

import 'package:flutter/material.dart';

class PricingView extends StatefulWidget {
  const PricingView({super.key});

  @override
  State<PricingView> createState() => _PricingViewState();
}

class _PricingViewState extends State<PricingView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: List<Widget>.generate(
            10,
            (int i) => Container(
                  width: 100,
                  height: 100,
                  color: Color.fromARGB(
                    255,
                    Random(22 + i).nextInt(255),
                    Random(12 + 1).nextInt(255),
                    Random(32 + i).nextInt(255),
                  ),
                )),
      ),
    );
  }
}
