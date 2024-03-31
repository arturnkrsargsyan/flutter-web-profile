import 'package:flutter/material.dart';
import 'package:loanxtimate/consts/app_colors.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    Key? key,
    required this.tabName,
    required this.isSelected,
  }) : super(key: key);

  final String tabName;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final Color textColor =
        isSelected ? AppColors.grey : AppColors.greyTextInput;

    final Widget body = Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
        child: Text(
          tabName,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(4),
      child: isSelected
          ? Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(6),
              color: isSelected ? AppColors.white : null,
              child: body,
            )
          : body,
    );
  }
}
