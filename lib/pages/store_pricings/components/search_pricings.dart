import 'package:flutter/material.dart';

class SearchPricings extends StatelessWidget {
  final TextEditingController searchText;
  final Function()? onClear;

  const SearchPricings({
    super.key,
    required this.searchText,
    this.onClear,
  });

  Widget _searchBar() => Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchText,
              decoration: _searchBarDecoration(),
              autofocus: true,
            ),
          ),
        ],
      );

  InputDecoration _searchBarDecoration() => InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
        ),
        suffixIcon: searchText.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: onClear,
              )
            : const SizedBox(width: 0.0),
      );

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
