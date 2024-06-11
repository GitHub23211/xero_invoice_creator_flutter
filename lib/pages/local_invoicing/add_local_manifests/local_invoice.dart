import 'dart:core';
import 'package:flutter/material.dart';
import 'package:xero_app_flutter/models/invoice_model.dart';
import 'package:xero_app_flutter/global_components/navbar.dart';
import 'package:xero_app_flutter/pages/local_invoicing/add_local_manifests/components/entered_manifests.dart';
import 'package:xero_app_flutter/pages/local_invoicing/add_local_manifests/components/form_buttons.dart';
import 'package:xero_app_flutter/pages/local_invoicing/add_local_manifests/components/man_info_form.dart';
import 'package:xero_app_flutter/pages/local_invoicing/add_local_manifests/components/store_num_form.dart';

class LocalInvoicing extends StatefulWidget {
  final InvoiceModel invoice;

  const LocalInvoicing({
    super.key,
    required this.invoice,
  });

  @override
  State<LocalInvoicing> createState() => _LocalInvoicingState();
}

class _LocalInvoicingState extends State<LocalInvoicing> {
  final TextEditingController _manNum = TextEditingController();
  final TextEditingController _manDate = TextEditingController();
  final TextEditingController _trailNum = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> _storeNums = <String>[];

  void _onSavedStoreNum(String? storeNum) {
    if (storeNum!.isNotEmpty && widget.invoice.isValidStoreNum(storeNum)) {
      _storeNums.add(storeNum);
    }
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_storeNums.isNotEmpty) {
        Map<String, dynamic> data = <String, dynamic>{
          'stores': _storeNums,
          'manNum': _manNum.text,
          'manDate': _manDate.text,
          'trailNum': _trailNum.text,
        };

        widget.invoice.addLineItem(data);
        widget.invoice.updateManNums(_manNum.text);
        setState(() => _storeNums.clear());
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _manNum.dispose();
    _manDate.dispose();
    _trailNum.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(title: widget.invoice.getInfo()),
      body: Container(
        color: Colors.lightBlue.shade50,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 200.0,
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ManInfoForm(
                    manDateController: _manDate,
                    manNumController: _manNum,
                    trailNumController: _trailNum,
                  ),
                  StoreNumForm(
                    onSubmit: _onSubmit,
                    onSaved: _onSavedStoreNum,
                  ),
                  EnteredManifests(
                    invoice: widget.invoice,
                  ),
                  FormButtons(
                    onPressed: widget.invoice.save,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
