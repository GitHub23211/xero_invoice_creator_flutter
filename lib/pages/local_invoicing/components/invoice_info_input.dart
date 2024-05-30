import 'package:flutter/material.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/elements/text_form_input.dart';

class InvoiceInfoForm extends StatelessWidget {
  final Function(String? s) onSavedInvNum;
  final Function(String? s) onSavedInvDate;
  final Function(String? s) onSavedManNum;
  final Function(String? s) onSavedTrailNum;

  const InvoiceInfoForm({
    super.key,
    required this.onSavedInvNum,
    required this.onSavedInvDate,
    required this.onSavedManNum,
    required this.onSavedTrailNum,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ExcludeFocus(
          child: Expanded(
              child: TextFormInput(
            onSaved: onSavedInvNum,
            labelText: 'Invoice Number',
          )),
        ),
        Expanded(
          child: TextFormInput(
            onSaved: onSavedInvDate,
            labelText: 'Issue date',
          ),
        ),
        Expanded(
          child: TextFormInput(
            onSaved: onSavedManNum,
            labelText: 'Manifest Number',
          ),
        ),
        Expanded(
          child: TextFormInput(
            onSaved: onSavedTrailNum,
            labelText: 'Trailer Number (Optional)',
          ),
        ),
      ],
    );
  }
}
