import 'package:flutter/material.dart';

class SearchPricings extends StatelessWidget {
  final Function(String?) onChanged;

  const SearchPricings({
    super.key,
    required this.onChanged,
  });

  Widget _searchBar() => Row(
        children: [
          Expanded(
            child: TextField(
              decoration: _searchBarDecoration(),
              onChanged: onChanged,
            ),
          ),
        ],
      );

  InputDecoration _searchBarDecoration() => InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.close),
        ),
      );

  @override
  Widget build(BuildContext context) {
    double sidePadding = MediaQuery.of(context).size.width * 0.2;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sidePadding,
      ),
      child: _searchBar(),
    );
  }
}
