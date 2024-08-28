import 'package:flutter/material.dart';
import 'package:xero_app_flutter/global_components/navbar.dart';
import 'package:xero_app_flutter/pages/home/components/menu.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: NavBar(
          title: 'Xero App - Home',
        ),
        body: Center(
          child: Menu(),
        ));
  }
}
