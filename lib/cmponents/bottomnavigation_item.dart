import 'package:first_app/config/app_icons.dart';
import 'package:first_app/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomnavigationItem extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;
  final Menues current;
  final Menues name;
  const BottomnavigationItem(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.current,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(icon,
            colorFilter: ColorFilter.mode(
                current == name ? Colors.black : Colors.black.withOpacity(0.3),
                BlendMode.srcIn)));
  }
}
