import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/elements/text_form_input.dart';
import 'package:xero_app_flutter/providers/data_provider.dart';

class StoreNumForm extends StatelessWidget {
  final Function()? onAdd;

  const StoreNumForm({
    super.key,
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    double mQueryWidth = MediaQuery.of(context).size.width * 1;
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Consumer<DataProvider>(
        builder: (context, data, child) {
          return Column(
            children: [
              SizedBox(
                width: mQueryWidth,
                child: TextFormInput(
                    labelText: 'Store',
                    onSaved: (String? s) => data.addManifest(s)),
              ),
              SizedBox(
                width: mQueryWidth,
                child: TextFormInput(
                    labelText: 'Store',
                    onSaved: (String? s) => data.addManifest(s)),
              ),
              SizedBox(
                width: mQueryWidth,
                child: TextFormInput(
                    labelText: 'Store',
                    onSaved: (String? s) => data.addManifest(s)),
              ),
              ExcludeFocus(
                  child: ElevatedButton(
                onPressed: onAdd,
                child: const Text('Add Manifest'),
              )),
            ],
          );
        },
      ),
    );
  }
}
