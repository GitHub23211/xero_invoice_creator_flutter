import 'package:flutter/material.dart';

class AllowanceCheckbox extends StatefulWidget {
  final Function(bool?) onChanged;

  const AllowanceCheckbox({
    super.key,
    required this.onChanged,
  });

  @override
  State<AllowanceCheckbox> createState() => _AllowanceCheckboxState();
}

class _AllowanceCheckboxState extends State<AllowanceCheckbox> {
  bool _checkboxValue = false;

  void _onClick(bool? s) {
    widget.onChanged(s);
    setState(() {
      _checkboxValue = !_checkboxValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CheckboxListTile(
        title: const Text('Loaded by driver?'),
        value: _checkboxValue,
        onChanged: _onClick,
      ),
    );
  }
}
