import 'package:flutter/material.dart';

class SearchPricings extends StatelessWidget {
  const SearchPricings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      leading: const Icon(Icons.search),
      trailing: <Widget>[
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {},
        ),
      ],
    );
  }
}
