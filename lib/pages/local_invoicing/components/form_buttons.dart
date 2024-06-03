import 'package:flutter/material.dart';

class FormButtons extends StatelessWidget {
  final Function()? onPressed;
  const FormButtons({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ExcludeFocus(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: onPressed,
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
