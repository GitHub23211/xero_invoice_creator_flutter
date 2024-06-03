import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/elements/text_form_input.dart';

class InvoiceInfoForm extends StatefulWidget {
  final TextEditingController invNumController;
  final TextEditingController invDateController;
  final TextEditingController dueDateController;
  final bool displayOnly;
  final Function()? onSubmit;

  const InvoiceInfoForm({
    super.key,
    required this.invNumController,
    required this.invDateController,
    required this.dueDateController,
    this.onSubmit,
    this.displayOnly = false,
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
      widget.dueDateController.text = _invDateFormatter
          .format(DateTime(date.year, date.month, date.day + 30));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormInput(
          controller: widget.invNumController,
          labelText: 'Invoice Number',
        ),
        TextFormInput(
          controller: widget.invDateController,
          labelText: 'Issue date',
          onTap: _selectDate,
          readOnly: true,
        ),
        TextFormInput(
          controller: widget.dueDateController,
          labelText: 'Due date',
          readOnly: true,
        ),
        ElevatedButton(
          onPressed: widget.onSubmit,
          child: Text('Submit'),
        )
      ],
    );
  }
}
