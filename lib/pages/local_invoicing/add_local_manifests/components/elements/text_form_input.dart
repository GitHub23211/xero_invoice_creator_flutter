import 'package:flutter/material.dart';

class TextFormInput extends StatelessWidget {
  final String? labelText;
  final Function(String?)? onSaved;
  final Function()? onTap;
  final TextEditingController? controller;
  final bool readOnly;

  const TextFormInput({
    super.key,
    this.onSaved,
    this.onTap,
    this.controller,
    this.labelText,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        child: TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            labelText: labelText,
          ),
          controller: controller,
          onSaved: onSaved,
          onTap: onTap,
          readOnly: readOnly,
        ));
  }
}
