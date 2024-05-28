import 'package:flutter/material.dart';

class FormButtons extends StatelessWidget {
  const FormButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return ExcludeFocus(
      child: Row(
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
      ),
    );
  }
}
