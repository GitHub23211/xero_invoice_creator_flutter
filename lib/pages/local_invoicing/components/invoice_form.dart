import 'package:flutter/material.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/entered_manifests.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/form_buttons.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/invoice_info_input.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/store_num_form.dart';

class InvoiceForm extends StatefulWidget {
  const InvoiceForm({super.key});

  @override
  State<InvoiceForm> createState() => _InvoiceFormState();
}

class _InvoiceFormState extends State<InvoiceForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: const Column(
        children: [
          InvoiceInfoForm(),
          StoreNumForm(),
          EnteredManifests(),
          SizedBox(height: 10),
          FormButtons(),
        ],
      ),
    );
  }
}
