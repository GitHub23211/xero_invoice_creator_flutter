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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context)
                ..pop()
                ..pop(),
              child: const Text('Cancel'),
            ),
            const SizedBox(width: 50.0),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
