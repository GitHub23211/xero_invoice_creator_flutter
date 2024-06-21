import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  Widget _customViewTile() => DefaultTextStyle.merge(
        style: const TextStyle(
          fontSize: 16.0,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Row(
            children: [
              MouseRegion(
                child: Text(
                  widget.storeInfo[2],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onHover: (PointerHoverEvent e) => debugPrint('hover num'),
              ),
              const SizedBox(width: 30.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MouseRegion(
                    child: Text(
                      widget.storeInfo[0],
                    ),
                    onHover: (PointerHoverEvent e) => debugPrint('hover'),
                  ),
                  MouseRegion(
                    child: Text(
                      '\$${widget.storeInfo[1]}',
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    onHover: (PointerHoverEvent e) => debugPrint('hover price'),
                  ),
                ],
              ),
              Spacer(),
              _tileOptions()
            ],
          ),
        ),
      );

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
    return _isEditing ? _customViewTile() : _customViewTile();
  }
}
