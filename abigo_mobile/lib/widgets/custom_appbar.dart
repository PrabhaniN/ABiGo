import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({
    Key key,
    @required this.height,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Column();
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}