import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xero_app_flutter/pages/local_invoicing/add_local_manifests/components/elements/text_form_input.dart';

class ManInfoForm extends StatefulWidget {
  final String earliestDate;
  final TextEditingController manNumController;
  final TextEditingController manDateController;
  final TextEditingController trailNumController;

  const ManInfoForm({
    super.key,
    required this.earliestDate,
    required this.manDateController,
    required this.manNumController,
    required this.trailNumController,
  });

  @override
  State<ManInfoForm> createState() => _ManInfoFormState();
}

class _ManInfoFormState extends State<ManInfoForm> {
  final DateFormat _invDateFormatter = DateFormat('dd/MM/yy');
  final RegExp regExp = RegExp(r'[^\d]');

  Future<void> _selectDate() async {
    int dateRange = 10;
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: _invDateFormatter.parse(widget.earliestDate),
      lastDate: DateTime(DateTime.now().year + dateRange),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );

    if (date != null) {
      widget.manDateController.text = _invDateFormatter.format(date);
    }
  }

  String? _manNumValidator(String? input) {
    if (input == null) return null;
    if (input.length < 8) return 'Invalid manifest number';
    RegExpMatch? match = regExp.firstMatch(input);
    if (match != null) return 'Nubmers only';
    return null;
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
            validator: (s) => s!.isNotEmpty ? null : 'Enter date',
            readOnly: true,
          ),
        ),
        Expanded(
          child: TextFormInput(
            controller: widget.manNumController,
            maxLength: 8,
            labelText: 'Manifest Number',
            validator: _manNumValidator,
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
