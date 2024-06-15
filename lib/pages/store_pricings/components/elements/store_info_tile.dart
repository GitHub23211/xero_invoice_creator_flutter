import 'package:flutter/material.dart';

class StoreInfoTile extends StatelessWidget {
  final List<dynamic> storeInfo;
  const StoreInfoTile({
    super.key,
    required this.storeInfo,
  });

  Widget _tileOptions() => SizedBox(
        width: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        storeInfo[2],
        style: const TextStyle(
          fontSize: 16.0,
        ),
      ),
      title: Text(storeInfo[0]),
      subtitle: Text(
        '\$${storeInfo[1]}',
      ),
      trailing: _tileOptions(),
    );
  }
}
