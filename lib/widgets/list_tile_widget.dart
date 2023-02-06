
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    Key? key,  this.color,  this.icon,  this.onTap,this.text,
  }) : super(key: key);
  final Color? color;
  final IconData? icon;
  final Function? onTap;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){},
      selectedColor: Theme.of(context).primaryColor,
      selected: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 6,
      ),
      leading: const Icon(
        Icons.group,
      ),
      title: const Text(
        'Groups',
        style: TextStyle(color: Colors.green),
      ),
    );
  }
}
