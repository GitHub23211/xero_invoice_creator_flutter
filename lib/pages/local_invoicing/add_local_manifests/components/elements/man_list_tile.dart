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
      : const Icon(
          Icons.cancel_outlined,
          color: Colors.red,
        );

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        title: Text('${itemLine['Description']}'),
        subtitle: Text('\$${itemLine['UnitAmount']}'),
        trailing: InkWell(
            onTap: onTap,
            hoverColor: Colors.black12,
            borderRadius: BorderRadius.circular(10.0),
            child: _renderDeleteButton()),
      ),
      const Divider(
        height: 5,
        thickness: 2,
      ),
    ]);
  }
}
