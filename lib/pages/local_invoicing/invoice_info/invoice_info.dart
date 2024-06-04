import 'package:xero_app_flutter/global_components/navbar.dart';
import 'package:xero_app_flutter/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:xero_app_flutter/models/invoice_model.dart';
import 'package:xero_app_flutter/pages/local_invoicing/add_local_manifests/local_invoice.dart';
import 'package:xero_app_flutter/pages/local_invoicing/invoice_info/components/invoice_info_form.dart';

class InvoiceInfoInput extends StatefulWidget {
  const InvoiceInfoInput({super.key});

  @override
  State<InvoiceInfoInput> createState() => _InvoiceInfoInputState();
}

class _InvoiceInfoInputState extends State<InvoiceInfoInput> {
  final TextEditingController _invNum = TextEditingController();
  final TextEditingController _invDate = TextEditingController();
  final TextEditingController _dueDate = TextEditingController();
  final NumberFormat _invNumFormatter = NumberFormat('00000000');
  late final InvoiceModel _invoice;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    DataProvider dataProvider = context.read<DataProvider>();

    await dataProvider.fetchLocalPricing();
    await dataProvider.fetchFixedInfo();

    _invoice = InvoiceModel(
      dataProvider.getLocalPricing(),
      dataProvider.getFixedInfo(),
    );
  }

  void _goToLocalInvoice() {
    _invoice.setInvoiceInfo(
      _invDate.text,
      _dueDate.text,
      _invNumFormatter.format(int.parse(_invNum.text)),
    );

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LocalInvoicing(
              invoice: _invoice,
            )));
  }

  @override
  void dispose() {
    super.dispose();
    _invNum.dispose();
    _invDate.dispose();
    _dueDate.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sidePadding = MediaQuery.of(context).size.width * 0.35;

    return Scaffold(
      appBar: const NavBar(title: 'Create Local Invoice'),
      body: Padding(
        padding: EdgeInsets.fromLTRB(sidePadding, 0, sidePadding, 0),
        child: Form(
          child: InvoiceInfoForm(
            invNumController: _invNum,
            invDateController: _invDate,
            dueDateController: _dueDate,
            onSubmit: _goToLocalInvoice,
          ),
        ),
      ),
    );
  }
}
