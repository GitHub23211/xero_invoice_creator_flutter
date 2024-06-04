import 'package:flutter/material.dart';

class ManListTile extends StatelessWidget {
  final Map<String, dynamic> itemLine;
  final Function()? onTap;
  const ManListTile({
    super.key,
    required this.itemLine,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.center,
      title: Text('${itemLine['Description']}'),
      subtitle: Text('\$${itemLine['UnitAmount']}'),
      trailing: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
