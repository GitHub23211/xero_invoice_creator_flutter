import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xero_app_flutter/pages/home/components/menu_button.dart';
import 'package:xero_app_flutter/providers/menu_text_provider.dart';

class MenuButtons extends StatefulWidget {
  const MenuButtons({super.key});

  @override
  State<MenuButtons> createState() => _MenuButtonsState();
}

class _MenuButtonsState extends State<MenuButtons> {
  @override
  Widget build(BuildContext context) {
    void changeTextOnHover(bool isHover, String text) {
      if (isHover) {
        context.read<MenuTextProvider>().changeText(text);
      }
    }

    return Container(
        color: Colors.red,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MenuButton(
              buttonText: 'Local Invoicing',
              description: 'local invoicing',
            ),
            MenuButton(
              buttonText: 'Rigid Invoicing',
              description: 'rigid invoicing',
            ),
            MenuButton(
              buttonText: 'Employee Pay',
              description: 'employee pay',
            ),
            MenuButton(
              buttonText: 'Local Subbie Pay',
              description: 'subbie pay',
            ),
            MenuButton(
              buttonText: 'Store Pricings',
              description: 'store pricing',
            ),
          ],
        ));
  }
}
