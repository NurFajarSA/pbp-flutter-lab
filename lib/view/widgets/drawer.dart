import 'package:flutter/material.dart';

// Refactor
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key, required this.title, required this.menu});

  final String title;
  final Map<String, void Function()?> menu;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          for (var item in menu.entries)
            ListTile(
              title: Text(item.key),
              onTap: item.value,
            ),
        ],
      ),
    );
  }
}
