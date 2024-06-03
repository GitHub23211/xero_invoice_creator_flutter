import 'package:flutter/material.dart';
import 'package:xero_app_flutter/pages/home/components/elements/menu_button.dart';
import 'package:xero_app_flutter/pages/local_invoicing/invoice_info_input.dart';
import 'package:xero_app_flutter/pages/local_invoicing/local_invoice.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MenuButton(
          buttonText: 'Local Invoicing',
          description: 'local invoicing',
          page: InvoiceInfoInput(),
        ),
        MenuButton(
          buttonText: 'Rigid Invoicing',
          description: 'rigid invoicing',
          page: InvoiceInfoInput(),
        ),
        MenuButton(
          buttonText: 'Employee Pay',
          description: 'employee pay',
          page: InvoiceInfoInput(),
        ),
        MenuButton(
          buttonText: 'Local Subbie Pay',
          description: 'subbie pay',
          page: InvoiceInfoInput(),
        ),
        MenuButton(
          buttonText: 'Store Pricings',
          description: 'store pricing',
          page: InvoiceInfoInput(),
        ),
      ],
    );
  }
}
