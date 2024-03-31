import 'package:flutter/material.dart';
import 'package:loanxtimate/consts/app_colors.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.index,
    required this.pageController,
    required this.leading,
    required this.title,
    this.textColor = AppColors.grey,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
  });

  final int index;
  final Widget leading;
  final String title;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor:
          pageController.page == index ? AppColors.white2 : AppColors.white,
      hoverColor: AppColors.white2,
      splashColor: AppColors.white2,
      leading: leading,
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
      minLeadingWidth: 24,
      onTap: () {
        pageController.jumpToPage(index);
        Navigator.of(context).pop();
      },
    );
  }
}
