import 'package:flutter/material.dart';


class DrawerEntry extends StatefulWidget {
  const DrawerEntry({super.key, required this.tiltIcon,required this.title,required this.tap});

  final IconData tiltIcon;
  final String title;
  final Function tap;

  @override
  State<DrawerEntry> createState() => _DrawerEntryState();
}

class _DrawerEntryState extends State<DrawerEntry> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: ListTile(
        leading: Icon(
          widget.tiltIcon,
          color: Colors.white,
        ),
        title: Text(widget.title, style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white
        ),
        ),
      ),
    );
  }
}