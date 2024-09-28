import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xero_app_flutter/global_components/popup_dialogue.dart';
import 'package:xero_app_flutter/pages/store_pricings/components/elements/trailing_tile_options.dart';
import 'package:xero_app_flutter/controllers/data_controller.dart';

class StoreInfoTile extends StatefulWidget {
  final String initialStoreNum;
  final TextEditingController storeNum;
  final TextEditingController storeName;
  final TextEditingController storePricing;

  const StoreInfoTile({
    super.key,
    required this.initialStoreNum,
    required this.storeNum,
    required this.storeName,
    required this.storePricing,
  });

  @override
  State<StoreInfoTile> createState() => _StoreInfoTileState();
}

class _StoreInfoTileState extends State<StoreInfoTile> {
  bool _isEditing = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    widget.storeNum.dispose();
    widget.storeName.dispose();
    widget.storePricing.dispose();
  }

  void _setMode() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _onSave() async {
    await context.read<DataController>().updateLocalPricing(
          oldStoreNum: widget.initialStoreNum,
          newStoreNum: widget.storeNum.text,
          storeName: widget.storeName.text,
          storePricing: int.parse(widget.storePricing.text),
        );
    _setMode();
  }

  void _onDelete() {
    String num = widget.storeNum.text;
    String name = widget.storeName.text;
    PopupDialogue.warningPopup(
      context: context,
      title: 'Delete $num $name',
      content: 'Are you sure you want to delete Store $num $name',
      onYes: () => context
          .read<DataController>()
          .deleteLocalPricing(widget.initialStoreNum),
    );
  }

  Widget _customViewTile() => DefaultTextStyle.merge(
        style: const TextStyle(
          fontSize: 16.0,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Row(
            children: [
              Text(
                widget.storeNum.text,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 30.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.storeName.text),
                  Text(
                    '\$${widget.storePricing.text}',
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
              const Spacer(),
              TrailingTileOptions(
                isEditing: _isEditing,
                onSave: _onSave,
                onDelete: _onDelete,
                setMode: _setMode,
              ),
            ],
          ),
        ),
      );

  Widget _editTile() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Row(
            children: [
              SizedBox(
                width: 80,
                height: 50,
                child: TextFormField(
                  controller: widget.storeNum,
                ),
              ),
              const SizedBox(width: 30.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: TextFormField(
                      controller: widget.storeName,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: TextFormField(
                      controller: widget.storePricing,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              TrailingTileOptions(
                isEditing: _isEditing,
                onSave: _onSave,
                onDelete: _onDelete,
                setMode: _setMode,
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return _isEditing ? _editTile() : _customViewTile();
  }
}
