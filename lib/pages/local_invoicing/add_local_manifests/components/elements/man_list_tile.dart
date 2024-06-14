import 'package:flutter/material.dart';

class ManListTile extends StatelessWidget {
  final Map<String, dynamic> itemLine;
  final Function()? onTap;
  const ManListTile({
    super.key,
    required this.itemLine,
    this.onTap,
  });

  Widget _renderDeleteButton() => itemLine['ItemCode'] == ('DROP-RATE')
      ? const SizedBox(
          width: 0.0,
        )
      : IconButton(
          icon: const Icon(
            Icons.cancel_outlined,
            color: Colors.red,
          ),
          onPressed: onTap,
        );

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        title: Text('${itemLine['Description']}'),
        subtitle: Text('\$${itemLine['UnitAmount']}'),
        trailing: _renderDeleteButton(),
      ),
      const Divider(
        height: 5,
        thickness: 2,
      ),
    ]);
  }
}
