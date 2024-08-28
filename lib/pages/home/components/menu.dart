import 'package:flutter/material.dart';
import 'package:xero_app_flutter/pages/home/components/elements/menu_button.dart';
import 'package:xero_app_flutter/pages/local_invoicing/invoice_info/invoice_info.dart';
import 'package:xero_app_flutter/pages/store_pricings/store_pricings.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MenuButton(
          buttonText: 'Local Invoicing',
          description: 'local invoicing',
          page: InvoiceInfoInput(),
        ),
        const SizedBox(height: 50.0),
        MenuButton(
          buttonText: 'Store Pricings',
          description: 'store pricing',
          page: StorePricings(),
        ),
      ],
    );
  }
}
