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
      trailing: GestureDetector(
        onTap: onTap,
        child: Icon(Icons.delete),
      ),
    );
  }
}
