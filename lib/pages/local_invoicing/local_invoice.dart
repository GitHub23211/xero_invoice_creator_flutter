import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'dart:core';
import 'package:xero_app_flutter/global_components/navbar.dart';
import 'package:xero_app_flutter/models/invoice_model.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/entered_manifests.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/form_buttons.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/invoice_info_input.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/store_num_form.dart';
import 'package:xero_app_flutter/providers/data_provider.dart';

class LocalInvoicing extends StatefulWidget {
  const LocalInvoicing({super.key});

  @override
  State<LocalInvoicing> createState() => _LocalInvoicingState();
}

class _LocalInvoicingState extends State<LocalInvoicing> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _invNum = TextEditingController();
  final TextEditingController _invDate = TextEditingController();
  final TextEditingController _manNum = TextEditingController();
  final TextEditingController _trailNum = TextEditingController();
  final NumberFormat _invNumFormatter = NumberFormat('00000000');

  late InvoiceModel _invoice;
  late Map<String, dynamic> _pricing;
  late Map<String, dynamic> _fixedInfo;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    DataProvider dataProvider = context.read<DataProvider>();

    await dataProvider.fetchLocalPricing();
    await dataProvider.fetchFixedInfo();

    _pricing = dataProvider.getLocalPricing();
    _fixedInfo = dataProvider.getFixedInfo();
    _invoice = InvoiceModel(_fixedInfo['HEADERS']);
  }

  void _onSavedStoreNum(String? storeNum) {}

  void _onSubmit() {
    _formKey.currentState?.save();
    // Get and convert all necessary entry data.
    debugPrint(_invNumFormatter.format(int.parse(_invNum.text)));
    debugPrint(_invDate.text);

    _updateInvoice();
  }

  void _updateInvoice() {
    List<dynamic> row = [
      _fixedInfo['CONTACT'],
      _fixedInfo['CODE'],
      _fixedInfo['TAX']
    ];
    _invoice.addLocalManifest([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const NavBar(title: 'Create Local Invoice'),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              InvoiceInfoForm(
                invNumController: _invNum,
                invDateController: _invDate,
                manNumController: _manNum,
                trailNumController: _trailNum,
              ),
              StoreNumForm(onSubmit: _onSubmit, onSaved: _onSavedStoreNum),
              EnteredManifests(),
              FormButtons(),
            ],
          ),
        ));
  }
}
