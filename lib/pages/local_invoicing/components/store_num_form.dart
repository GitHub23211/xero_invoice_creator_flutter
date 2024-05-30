import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/elements/text_form_input.dart';
import 'package:xero_app_flutter/providers/data_provider.dart';

class StoreNumForm extends StatelessWidget {
  final Function() onSubmit;
  final Function(String? s) onSaved;

  const StoreNumForm({
    super.key,
    required this.onSubmit,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    double mQueryWidth = MediaQuery.of(context).size.width * 1;
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            width: mQueryWidth,
            child: TextFormInput(
              labelText: 'Store',
              onSaved: onSaved,
            ),
          ),
          SizedBox(
              width: mQueryWidth,
              child: TextFormInput(
                labelText: 'Store',
                onSaved: onSaved,
              )),
          SizedBox(
              width: mQueryWidth,
              child: TextFormInput(
                labelText: 'Store',
                onSaved: onSaved,
              ) //data.addManifest(s)),
              ),
          ExcludeFocus(
              child: ElevatedButton(
            onPressed: onSubmit,
            child: const Text('Add Manifest'),
          )),
        ],
      ),
    );
  }
}
