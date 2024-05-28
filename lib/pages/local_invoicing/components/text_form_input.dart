import 'package:flutter/material.dart';

class TextFormInput extends StatelessWidget {
  final String labelText;
  final Function(String?)? onSaved;

  const TextFormInput({
    super.key,
    required this.labelText,
    this.onSaved,
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
          onSaved: onSaved,
        ));
  }
}
