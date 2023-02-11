import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Icon icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blueAccent,
      onTap: onTap,
      child: Card(
        elevation: 5,
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: icon,
        ),
      ),
    );
  }
}
