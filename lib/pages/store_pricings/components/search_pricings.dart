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
            ),
          ),
        ],
      );

  InputDecoration _searchBarDecoration() => InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: onClear,
        ),
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
