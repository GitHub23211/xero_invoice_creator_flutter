import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormInput extends StatelessWidget {
  final String? labelText;
  final int? maxLength;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function()? onTap;

  const TextFormInput({
    super.key,
    this.labelText,
    this.readOnly = false,
    this.inputFormatters,
    this.controller,
    this.validator,
    this.onSaved,
    this.onTap,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          counterText: "",
        ),
        controller: controller,
        onSaved: onSaved,
        onTap: onTap,
        readOnly: readOnly,
        validator: validator,
        inputFormatters: inputFormatters,
        maxLength: maxLength,
      ),
    );
  }
}
