import 'package:flutter/material.dart';
import 'package:xero_app_flutter/global_components/navbar.dart';
import 'package:xero_app_flutter/pages/home/components/menu.dart';
import 'package:xero_app_flutter/pages/home/components/menu_text.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(
        title: 'Xero App - Home',
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Menu(),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlue.shade50,
                  borderRadius: BorderRadius.circular(10.0)),
              child: const MenuText(),
            ),
          )
        ],
      ),
    );
  }
}
