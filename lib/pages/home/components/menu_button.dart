import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xero_app_flutter/providers/menu_text_provider.dart';

class MenuButton extends StatelessWidget {
  final String buttonText;
  final String description;
  final Widget page;

  const MenuButton({
    super.key,
    required this.buttonText,
    required this.description,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    void changeTextOnHover(bool isHover, String text) {
      if (isHover) {
        context.read<MenuTextProvider>().changeText(text);
      }
    }

    void changeLocation() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
    }

    return SizedBox(
        width: 190,
        child: ElevatedButton(
          onPressed: changeLocation,
          onHover: (b) => changeTextOnHover(b, description),
          child: Text(buttonText),
        ));
  }
}
