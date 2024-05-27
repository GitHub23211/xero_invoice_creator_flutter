import 'package:flutter/material.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/text_form_input.dart';

class InvoiceInfoForm extends StatefulWidget {
  const InvoiceInfoForm({super.key});

  @override
  State<InvoiceInfoForm> createState() => _InvoiceInfoFormState();
}

class _InvoiceInfoFormState extends State<InvoiceInfoForm> {
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
