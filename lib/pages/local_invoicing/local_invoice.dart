import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xero_app_flutter/global_components/navbar.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/entered_manifests.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/form_buttons.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/invoice_info_input.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/store_num_form.dart';
import 'package:xero_app_flutter/providers/data_provider.dart';

class LocalInvoicing extends StatelessWidget {
  LocalInvoicing({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const NavBar(title: 'Create Local Invoice'),
        body: Form(
          key: _formKey,
          child: Consumer<DataProvider>(
            builder: (context, invoice, child) {
              return Column(
                children: [
                  InvoiceInfoForm(),
                  StoreNumForm(onAdd: () => _formKey.currentState?.save()),
                  EnteredManifests(),
                  FormButtons(),
                ],
              );
            },
          ),
        ));
  }
}
