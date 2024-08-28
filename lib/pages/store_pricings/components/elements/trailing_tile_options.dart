import 'package:flutter/material.dart';

class TrailingTileOptions extends StatelessWidget {
  final bool isEditing;
  final VoidCallback setMode;
  final VoidCallback onSave;
  final VoidCallback onDelete;

  const TrailingTileOptions({
    super.key,
    required this.isEditing,
    required this.onSave,
    required this.onDelete,
    required this.setMode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          isEditing
              ? IconButton(
                  onPressed: onSave,
                  icon: const Icon(Icons.check),
                )
              : IconButton(
                  onPressed: setMode,
                  icon: const Icon(Icons.edit),
                ),
          isEditing
              ? IconButton(
                  onPressed: setMode,
                  icon: const Icon(Icons.close),
                )
              : IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete),
                ),
        ],
      ),
    );
  }
}
