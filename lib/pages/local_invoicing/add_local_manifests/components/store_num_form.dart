import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xero_app_flutter/pages/local_invoicing/add_local_manifests/components/elements/allowance_checkbox.dart';
import 'package:xero_app_flutter/pages/local_invoicing/add_local_manifests/components/elements/text_form_input.dart';

class StoreNumForm extends StatelessWidget {
  final Function() onSubmit;
  final Function(String? s) onSaved;
  final Function(bool? b) onCheck;
  final int numStoreInputs = 3;
  final RegExp regExp = RegExp(r'[^\d]');
  final bool checkBoxValue;

  StoreNumForm({
    super.key,
    required this.onSubmit,
    required this.onSaved,
    required this.onCheck,
    required this.checkBoxValue,
  });

  String? _validator(String? input) {
    if (input == null) return null;
    RegExpMatch? match = regExp.firstMatch(input);
    if (match != null) return 'Nubmers only';
    return null;
  }

  List<Widget> _createStoreNumInputs(double mQW) =>
      List<Widget>.generate(numStoreInputs, (_) => _storeNumInput(mQW))
        ..add(_addManifestButton());

  Widget _storeNumInput(double mQW) => SizedBox(
        width: mQW,
        child: TextFormInput(
          labelText: 'Store',
          maxLength: 3,
          onSaved: onSaved,
          validator: _validator,
          inputFormatters: [FilteringTextInputFormatter.deny(regExp)],
        ),
      );

  Widget _addManifestButton() => ExcludeFocus(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AllowanceCheckbox(
              onChanged: onCheck,
              checkBoxValue: checkBoxValue,
            ),
            ElevatedButton(
              onPressed: onSubmit,
              child: const Text('Add Manifest'),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    double mQueryWidth = MediaQuery.of(context).size.width * 1;

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: _createStoreNumInputs(mQueryWidth),
      ),
    );
  }
}
