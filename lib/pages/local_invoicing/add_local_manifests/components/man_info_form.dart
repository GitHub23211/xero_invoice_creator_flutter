import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xero_app_flutter/pages/local_invoicing/add_local_manifests/components/elements/text_form_input.dart';

class ManInfoForm extends StatefulWidget {
  final TextEditingController manNumController;
  final TextEditingController manDateController;
  final TextEditingController trailNumController;

  const ManInfoForm({
    super.key,
    required this.manDateController,
    required this.manNumController,
    required this.trailNumController,
  });

  @override
  State<ManInfoForm> createState() => _ManInfoFormState();
}

class _ManInfoFormState extends State<ManInfoForm> {
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
      widget.manDateController.text = _invDateFormatter.format(date);
      widget.manDateController.text = _invDateFormatter
          .format(DateTime(date.year, date.month, date.day + 30));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: TextFormInput(
            controller: widget.manDateController,
            labelText: 'Manifest date',
            onTap: _selectDate,
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
