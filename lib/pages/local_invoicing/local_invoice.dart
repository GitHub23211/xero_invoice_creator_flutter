import 'dart:core';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:xero_app_flutter/global_components/navbar.dart';
import 'package:xero_app_flutter/models/invoice_model.dart';
import 'package:xero_app_flutter/models/invoice_strategy.dart';
import 'package:xero_app_flutter/models/local_strategy.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/entered_manifests.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/form_buttons.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/invoice_info_form.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/man_info_form.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/store_num_form.dart';
import 'package:xero_app_flutter/providers/data_provider.dart';

class LocalInvoicing extends StatefulWidget {
  const LocalInvoicing({super.key});

  @override
  State<LocalInvoicing> createState() => _LocalInvoicingState();
}

class _LocalInvoicingState extends State<LocalInvoicing> {
  final TextEditingController _invNum = TextEditingController();
  final TextEditingController _invDate = TextEditingController();
  final TextEditingController _dueDate = TextEditingController();
  final TextEditingController _manNum = TextEditingController();
  final TextEditingController _trailNum = TextEditingController();
  final List<String> _storeNums = List.empty(growable: true);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final NumberFormat _invNumFormatter = NumberFormat('00000000');
  late InvoiceStrategy _local;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    DataProvider dataProvider = context.read<DataProvider>();

    await dataProvider.fetchLocalPricing();
    await dataProvider.fetchFixedInfo();

    _local = LocalStrategy(
        dataProvider.getLocalPricing(), dataProvider.getFixedInfo());
    debugPrint('initialised');
  }

  void _onSavedStoreNum(String? storeNum) {
    if (storeNum != null) {
      _storeNums.add(storeNum);
    }
  }

  void _onSubmit() {
    _formKey.currentState!.save();
    if (_storeNums.isNotEmpty) {
      Map<String, dynamic> data = <String, dynamic>{
        'stores': _storeNums,
        'invNum': _invNumFormatter.format(int.parse(_invNum.text)),
        'issueDate': _invDate.text,
        'dueDate': _dueDate.text,
        'manNum': _manNum.text,
      };
      _local.processManInfo(data);
      _storeNums.clear();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _invNum.dispose();
    _invDate.dispose();
    _dueDate.dispose();
    _manNum.dispose();
    _trailNum.dispose();
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
                dueDateController: _dueDate,
                manNumController: _manNum,
                trailNumController: _trailNum,
              ),
              ManInfoForm(
                manDateController: _invDate,
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
