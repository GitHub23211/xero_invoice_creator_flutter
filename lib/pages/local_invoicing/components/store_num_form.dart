import 'package:flutter/material.dart';

class StoreNumForm extends StatefulWidget {
  const StoreNumForm({super.key});

  @override
  State<StoreNumForm> createState() => _StoreNumFormState();
}

class _StoreNumFormState extends State<StoreNumForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(),
        TextFormField(),
        TextFormField(),
      ],
    );
  }
}
