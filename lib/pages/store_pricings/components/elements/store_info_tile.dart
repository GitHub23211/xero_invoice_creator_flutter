import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final TextEditingController _initalStoreNum = TextEditingController();
  final TextEditingController _initialStoreName = TextEditingController();
  final TextEditingController _initalStorePricing = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initalStoreNum.text = widget.storeInfo[2];
    _initialStoreName.text = widget.storeInfo[0];
    _initalStorePricing.text = widget.storeInfo[1].toString();
  }

  void _setMode() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  Widget _textlabel({
    required String label,
    TextStyle? style,
    Function(PointerHoverEvent e)? onHover,
  }) =>
      MouseRegion(
        onHover: onHover,
        child: Text(
          label,
          style: style,
        ),
      );

  Widget _storeNumLabel() => _textlabel(
        label: _initalStoreNum.text,
        style: const TextStyle(fontWeight: FontWeight.w600),
        onHover: (PointerHoverEvent e) => debugPrint('hover num'),
      );

  Widget _storeNameLabel() => _textlabel(
        label: _initialStoreName.text,
        onHover: (PointerHoverEvent e) => debugPrint('hover'),
      );

  Widget _storePriceLabel() => _textlabel(
        label: '\$${_initalStorePricing.text}',
        style: const TextStyle(fontSize: 14.0),
        onHover: (PointerHoverEvent e) => debugPrint('hover'),
      );

  Widget _tileOptions() => SizedBox(
        width: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _isEditing
                ? IconButton(
                    onPressed: _setMode,
                    icon: const Icon(Icons.check),
                  )
                : IconButton(
                    onPressed: _setMode,
                    icon: const Icon(Icons.edit),
                  ),
            _isEditing
                ? IconButton(
                    onPressed: _setMode,
                    icon: const Icon(Icons.close),
                  )
                : IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  ),
          ],
        ),
      );

  Widget _customViewTile() => DefaultTextStyle.merge(
        style: const TextStyle(
          fontSize: 16.0,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Row(
            children: [
              _storeNumLabel(),
              const SizedBox(width: 30.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _storeNameLabel(),
                  _storePriceLabel(),
                ],
              ),
              const Spacer(),
              _tileOptions()
            ],
          ),
        ),
      );

  Widget _editTile() => DefaultTextStyle.merge(
        style: const TextStyle(
          fontSize: 16.0,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Row(
            children: [
              SizedBox(
                width: 80,
                height: 50,
                child: TextFormField(
                  initialValue: _initalStoreNum.text,
                  decoration: InputDecoration(
                    label: Text('Number'),
                  ),
                ),
              ),
              const SizedBox(width: 30.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                      initialValue: _initialStoreName.text,
                      decoration: InputDecoration(
                        label: Text('Name'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: TextFormField(
                      initialValue: _initalStorePricing.text,
                      decoration: InputDecoration(
                        label: Text('Pricing'),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              _tileOptions()
            ],
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return _isEditing ? _editTile() : _customViewTile();
  }
}
