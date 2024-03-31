import 'package:flutter/material.dart';
import 'package:loanxtimate/consts/app_colors.dart';

class AppNameItem extends StatelessWidget {
  const AppNameItem({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        name,
        style: const TextStyle(
          color: AppColors.appName,
          fontSize: 19,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
