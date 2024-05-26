import 'package:flutter/material.dart';
import 'package:xero_app_flutter/pages/home/components/menu_button.dart';
import 'package:xero_app_flutter/pages/local_invoicing/local_invoice.dart';

class MenuButtons extends StatefulWidget {
  const MenuButtons({super.key});

  @override
  State<MenuButtons> createState() => _MenuButtonsState();
}

class _MenuButtonsState extends State<MenuButtons> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MenuButton(
          buttonText: 'Local Invoicing',
          description: 'local invoicing',
          page: LocalInvoicing(),
        ),
        MenuButton(
          buttonText: 'Rigid Invoicing',
          description: 'rigid invoicing',
          page: LocalInvoicing(),
        ),
        MenuButton(
          buttonText: 'Employee Pay',
          description: 'employee pay',
          page: LocalInvoicing(),
        ),
        MenuButton(
          buttonText: 'Local Subbie Pay',
          description: 'subbie pay',
          page: LocalInvoicing(),
        ),
        MenuButton(
          buttonText: 'Store Pricings',
          description: 'store pricing',
          page: LocalInvoicing(),
        ),
      ],
    );
  }
}
