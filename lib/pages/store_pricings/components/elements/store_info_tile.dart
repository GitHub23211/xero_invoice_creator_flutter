import 'package:flutter/material.dart';
import 'package:xero_app_flutter/pages/local_invoicing/add_local_manifests/components/elements/text_form_input.dart';

class StoreInfoTile extends StatefulWidget {
  final List<dynamic> storeInfo;

  const StoreInfoTile({
    super.key,
    required this.storeInfo,
  });

  @override
  State<StoreInfoTile> createState() => _StoreInfoTileState();
}

class _StoreInfoTileState extends State<StoreInfoTile> {
  bool _isEditing = false;

  void _setMode() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  Widget _viewTile() => ListTile(
        leading: Text(
          widget.storeInfo[2],
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
        title: Text(widget.storeInfo[0]),
        subtitle: Text(
          '\$${widget.storeInfo[1]}',
        ),
        trailing: _tileOptions(),
      );

  Widget _editTile() => ListTile(
        leading: Text(
          widget.storeInfo[2],
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
        title: TextFormInput(),
        subtitle: Text(
          '\$${widget.storeInfo[1]}',
        ),
        trailing: _tileOptions(),
      );

  Widget _tileOptions() => SizedBox(
        width: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: _setMode,
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
    return _isEditing ? _editTile() : _viewTile();
  }
}
