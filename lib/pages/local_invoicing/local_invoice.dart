import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  void _onSavedInvNum(String? invNum) {}
  void _onSavedInvDate(String? invDate) {}
  void _onSavedManNum(String? manNum) {}
  void _onSavedTrailerNum(String? trailNum) {}
  void _onSavedStoreNum(String? storeNum) {}

  void _updateInvoice() {
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
                onSavedInvNum: _onSavedInvNum,
                onSavedInvDate: _onSavedInvDate,
                onSavedManNum: _onSavedManNum,
                onSavedTrailNum: _onSavedTrailerNum,
              ),
              StoreNumForm(
                  onSubmit: () => _formKey.currentState?.save(),
                  onSaved: _onSavedStoreNum),
              EnteredManifests(),
              FormButtons(),
            ],
          ),
        ));
  }
}
