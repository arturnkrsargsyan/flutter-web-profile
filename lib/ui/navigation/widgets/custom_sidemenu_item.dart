import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:loanxtimate/consts/app_colors.dart';
import 'package:loanxtimate/ui/navigation/widgets/default_textstyle.dart';

class CustomSideMenuItem extends HookWidget {
  final int index;
  final String title;
  final Widget iconWidget;
  final double buttonGap;
  final double topGap;
  final bool isDesktop;
  final Color hoverColor;
  final Color selectedColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final bool isSelected;
  final void Function(int index) onTap;
  const CustomSideMenuItem({
    super.key,
    required this.index,
    required this.title,
    required this.iconWidget,
    required this.isDesktop,
    required this.isSelected,
    this.buttonGap = 0,
    this.topGap = 0,
    this.unselectedTextColor = AppColors.grey,
    this.selectedTextColor = AppColors.textColor,
    this.hoverColor = AppColors.white2,
    this.selectedColor = AppColors.white2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isHoveredState = useState(false);

    return Padding(
      padding: EdgeInsets.only(
          left: isDesktop ? 16 : 10, right: isDesktop ? 16 : 10),
      child: Column(
        children: [
          SizedBox(
            height: topGap,
          ),
          GestureDetector(
            onTap: () {
              onTap(index);
            },
            child: MouseRegion(
              onEnter: (event) => isHoveredState.value = true,
              onExit: (event) => isHoveredState.value = false,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                  color: isSelected
                      ? selectedColor
                      : isHoveredState.value
                          ? hoverColor
                          : AppColors.white,
                ),
                height: 40,
                width: isDesktop ? 281 : 50,
                padding: EdgeInsets.only(top: 8, bottom: 8, left: 12),
                child: Row(
                  children: [
                    iconWidget,
                    if (isDesktop)
                      SizedBox(
                        width: 12,
                      ),
                    if (isDesktop)
                      Text(
                        title,
                        style: CustomDefaultTextStyle(
                                color: isSelected
                                    ? selectedTextColor
                                    : unselectedTextColor)
                            .build(),
                      )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          SizedBox(
            height: buttonGap,
          ),
        ],
      ),
    );
  }
}
