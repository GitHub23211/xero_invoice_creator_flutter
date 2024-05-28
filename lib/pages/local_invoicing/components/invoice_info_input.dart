import 'package:flutter/material.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/elements/text_form_input.dart';

class InvoiceInfoForm extends StatelessWidget {
  const InvoiceInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ExcludeFocus(
          child: Expanded(child: TextFormInput(labelText: 'Invoice Number')),
        ),
        Expanded(child: TextFormInput(labelText: 'Issue date')),
        Expanded(child: TextFormInput(labelText: 'Manifest Number')),
        Expanded(child: TextFormInput(labelText: 'Trailer Number (Optional)')),
      ],
    );
  }
}
