import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xero_app_flutter/providers/menu_text_provider.dart';

class MenuText extends StatelessWidget {
  const MenuText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        child: Center(
          child: Text(
            context.watch<MenuTextProvider>().text,
          ),
        ));
  }
}
