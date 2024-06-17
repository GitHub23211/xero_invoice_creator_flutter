import 'package:flutter/material.dart';

class PopupDialogue {
  static Future<void> warningPopup({
    required BuildContext context,
    required String title,
    required String content,
    VoidCallback? onYes,
    VoidCallback? onNo,
  }) =>
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text(title),
                content: Text(content),
                actions: [
                  TextButton(
                    onPressed: onYes ?? Navigator.of(context).pop,
                    child: const Text('Yes'),
                  ),
                  TextButton(
                    onPressed: onNo ?? Navigator.of(context).pop,
                    child: const Text('No'),
                  ),
                ],
              ));
}
