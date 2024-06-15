import 'package:flutter/material.dart';

class StoreInfoTile extends StatelessWidget {
  final List<dynamic> storeInfo;
  const StoreInfoTile({
    super.key,
    required this.storeInfo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(storeInfo[2]),
      title: Text(storeInfo[0]),
      subtitle: Text(
        '\$${storeInfo[1]}',
      ),
    );
  }
}
