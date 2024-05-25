import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xero_app_flutter/providers/menu_text_provider.dart';

class MenuButton extends StatelessWidget {
  final String buttonText;
  final String description;

  const MenuButton({
    super.key,
    required this.buttonText,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    void changeTextOnHover(bool isHover, String text) {
      if (isHover) {
        context.read<MenuTextProvider>().changeText(text);
      }
    }

    return ElevatedButton(
        onPressed: () => {},
        onHover: (b) => changeTextOnHover(b, description),
        child: Text(buttonText));
  }
}
