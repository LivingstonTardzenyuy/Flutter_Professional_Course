import 'package:flutter/material.dart';

import '../constants.dart';
import '../styles/app_colors.dart';
import '../styles/app_text.dart';

class AppBarFile extends StatelessWidget implements PreferredSizeWidget {
    AppBarFile({required this.title,this.actions});
  late String title;
  late List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppText.header1,
      ),
      actions: actions,
      backgroundColor: AppColors.backgroundColor,
      foregroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
