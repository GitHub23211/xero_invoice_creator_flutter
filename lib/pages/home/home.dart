import 'package:flutter/material.dart';
import 'package:xero_app_flutter/global_components/navbar.dart';
import 'package:xero_app_flutter/pages/home/components/menu_buttons.dart';
import 'package:xero_app_flutter/pages/home/components/menu_text.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        title: title,
      ),
      body: const Row(
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
