import 'package:flutter/material.dart';
import 'package:xero_app_flutter/global_components/navbar.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/invoice_form.dart';

class LocalInvoicing extends StatefulWidget {
  const LocalInvoicing({super.key});

  @override
  State<LocalInvoicing> createState() => _LocalInvoicingState();
}

class _LocalInvoicingState extends State<LocalInvoicing> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: NavBar(title: 'Create Local Invoice'),
      body: InvoiceForm(),
    );
  }
}
