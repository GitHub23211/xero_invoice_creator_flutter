import 'package:flutter/material.dart';

class AllowanceCheckbox extends StatelessWidget {
  final Function(bool?) onChanged;
  final bool checkBoxValue;

  const AllowanceCheckbox({
    super.key,
    required this.onChanged,
    required this.checkBoxValue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 255,
      child: CheckboxListTile(
        title: const Text('Loaded by driver?'),
        value: checkBoxValue,
        onChanged: onChanged,
        secondary: const Icon(Icons.help_outline),
      ),
    );
  }
}
