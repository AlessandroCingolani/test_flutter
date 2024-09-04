import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  const Header({ required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


