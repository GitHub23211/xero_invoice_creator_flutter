import 'package:flutter/material.dart';

class InvoiceInfoForm extends StatefulWidget {
  const InvoiceInfoForm({super.key});

  @override
  State<InvoiceInfoForm> createState() => _InvoiceInfoFormState();
}

class _InvoiceInfoFormState extends State<InvoiceInfoForm> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            child: Container(
                margin: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                child: TextFormField())),
        Expanded(
            child: Container(
                margin: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                child: TextFormField())),
        Expanded(
            child: Container(
                margin: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                child: TextFormField())),
      ],
    );
  }
}
