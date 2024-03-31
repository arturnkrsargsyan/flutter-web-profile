import 'package:flutter/material.dart';
import 'package:loanxtimate/consts/app_colors.dart';
import 'package:loanxtimate/consts/app_padding.dart';
import 'package:loanxtimate/main.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final breakpoint = ResponsiveBreakpoints.of(context).breakpoint;
    return Container(
      constraints: const BoxConstraints(minWidth: webMinWidth),
      width: breakpoint.name == DESKTOP
          ? width - AppPadding.openSideMenuSize
          : width,
      height: 1,
      color: AppColors.borderColor,
    );
  }
}
