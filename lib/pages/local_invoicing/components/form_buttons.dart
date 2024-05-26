import 'package:flutter/material.dart';

class FormButtons extends StatefulWidget {
  const FormButtons({super.key});

  @override
  State<FormButtons> createState() => _FormButtonsState();
}

class _FormButtonsState extends State<FormButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () => {},
          child: const Text('Save'),
        ),
        ElevatedButton(
          onPressed: () => {},
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () => {},
          child: const Text('Delete'),
        )
      ],
    );
  }
}
