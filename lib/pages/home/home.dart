import 'package:flutter/material.dart';
import 'package:xero_app_flutter/global_components/navbar.dart';
import 'package:xero_app_flutter/pages/home/components/menu.dart';
import 'package:xero_app_flutter/pages/home/components/menu_text.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: NavBar(
        title: 'Xero App - Home',
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: MenuButtons(),
          ),
          Expanded(
            child: MenuText(),
          )
        ],
      ),
    );
  }
}
