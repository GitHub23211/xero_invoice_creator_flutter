import "package:flutter/material.dart";

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const NavBar({super.key, required this.title});

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.lightBlue,
    );
  }
}
