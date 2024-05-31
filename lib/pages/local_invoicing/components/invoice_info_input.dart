import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/elements/text_form_input.dart';

class InvoiceInfoForm extends StatefulWidget {
  final TextEditingController invNumController;
  final TextEditingController invDateController;
  final TextEditingController manNumController;
  final TextEditingController trailNumController;

  const InvoiceInfoForm({
    super.key,
    required this.invNumController,
    required this.invDateController,
    required this.manNumController,
    required this.trailNumController,
  });

  @override
  State<InvoiceInfoForm> createState() => _InvoiceInfoFormState();
}

class _InvoiceInfoFormState extends State<InvoiceInfoForm> {
  final DateFormat _invDateFormatter = DateFormat('dd/MM/yy');

  Future<void> _selectDate() async {
    int dateRange = 10;
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - dateRange),
      lastDate: DateTime(DateTime.now().year + dateRange),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );

    if (date != null) {
      widget.invDateController.text = _invDateFormatter.format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            child: TextFormInput(
          controller: widget.invNumController,
          labelText: 'Invoice Number',
        )),
        Expanded(
          child: TextFormInput(
            controller: widget.invDateController,
            labelText: 'Issue date',
            onTap: _selectDate,
            readOnly: true,
          ),
        ),
        Expanded(
          child: TextFormInput(
            controller: widget.manNumController,
            labelText: 'Manifest Number',
          ),
        ),
        Expanded(
          child: TextFormInput(
            controller: widget.trailNumController,
            labelText: 'Trailer Number (Optional)',
          ),
        ),
      ],
    );
  }
}
