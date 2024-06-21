import 'package:flutter/material.dart';

class SearchPricings extends StatefulWidget {
  final TextEditingController searchText;
  final Function()? onClear;

  const SearchPricings({
    super.key,
    required this.searchText,
    this.onClear,
  });

  @override
  State<SearchPricings> createState() => _SearchPricingsState();
}

class _SearchPricingsState extends State<SearchPricings> {
  late FocusNode _searchFocus;
  bool _showClearIcon = false;

  @override
  void initState() {
    super.initState();
    _searchFocus = FocusNode();
    _searchFocus.addListener(_toggleClearIcon);
  }

  Widget _searchBar() => Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.searchText,
              decoration: _searchBarDecoration(),
              autofocus: true,
              focusNode: _searchFocus,
            ),
          ),
        ],
      );

  InputDecoration _searchBarDecoration() => InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
        ),
        suffixIcon: _showClearIcon
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: widget.onClear,
              )
            : Container(),
      );

  void _toggleClearIcon() {
    setState(() {
      _showClearIcon = _searchFocus.hasFocus;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchFocus.removeListener(_toggleClearIcon);
    _searchFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sidePadding = MediaQuery.of(context).size.width * 0.4;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sidePadding,
      ),
      child: _searchBar(),
    );
  }
}
