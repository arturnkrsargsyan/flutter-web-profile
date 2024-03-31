import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loanxtimate/consts/app_colors.dart';
import 'package:loanxtimate/gen/assets.gen.dart';
import 'package:loanxtimate/ui/navigation/widgets/app_name_item.dart';
import 'package:loanxtimate/ui/navigation/widgets/custom_banner.dart';
import 'package:loanxtimate/ui/navigation/widgets/custom_sidemenu_item.dart';
import 'package:loanxtimate/ui/navigation/widgets/default_textstyle.dart';
import 'package:loanxtimate/ui/navigation/widgets/user_item.dart';

import 'package:responsive_framework/responsive_framework.dart';

final Map<String, Widget> sideBarItems = {
  "Home": SvgPicture.asset(
    Assets.vectors.home.path,
  ),
  "Generate LE": Image.asset(
    Assets.images.generate.path,
    fit: BoxFit.cover,
  ),
  "Customize Fees": SvgPicture.asset(
    Assets.vectors.customize.path,
  ),
  "Support": SvgPicture.asset(
    Assets.vectors.support.path,
  ),
  "Account": SvgPicture.asset(
    Assets.vectors.settings.path,
  ),
};

class CustomSideMenu extends HookWidget {
  const CustomSideMenu({
    super.key,
    required this.sideMenu,
    required this.breakpoint,
    required this.topPadding,
  });

  final SideMenuController sideMenu;
  final Breakpoint breakpoint;
  final double topPadding;
  buildSideBarItem(
      {required String title,
      required void Function(int index, SideMenuController sideMenuController)
          onTap,
      required Widget iconWidget}) {
    return SideMenuItem(title: title, iconWidget: iconWidget, onTap: onTap);
  }

  @override
  Widget build(BuildContext context) {
    handleClick(index) {
      switch (index) {
        case 0:
          context.go("/");
          break;
        case 1:
          context.go("/generate-le");
          break;
        case 2:
          context.go("/customize-fees");
          break;
        case 3:
          context.go("/support");
          break;
        case 4:
          context.go("/account/my-profile");

          break;
      }
    }

    final isDesktop = breakpoint.name == DESKTOP;
    final currentTab = useState<int>(4);
    return SideMenu(
      controller: sideMenu,
      style: SideMenuStyle(
        itemOuterPadding: EdgeInsets.only(
            left: isDesktop ? 16 : 8, bottom: 4, right: isDesktop ? 16 : 0),
        openSideMenuWidth: 281,
        displayMode:
            isDesktop ? SideMenuDisplayMode.open : SideMenuDisplayMode.compact,
        backgroundColor: AppColors.white,
        hoverColor: AppColors.white2,
        selectedHoverColor: AppColors.white2,
        itemBorderRadius: const BorderRadius.all(Radius.circular(6)),
        selectedColor: AppColors.white2,
        selectedTitleTextStyle: const CustomDefaultTextStyle().build(),
        unselectedTitleTextStyle: const CustomDefaultTextStyle().build(),
        selectedIconColor: AppColors.white,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      title: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: 32, bottom: 18, left: isDesktop ? 24 : 16),
            child: Row(
              children: [
                Image.asset(
                  width: 38,
                  height: 38,
                  Assets.images.logomark32h.path,
                  fit: BoxFit.cover,
                ),
                if (isDesktop)
                  const AppNameItem(
                    name: 'LoanXtimate',
                  ),
              ],
            ),
          ),
          const Divider(
            indent: 8.0,
            endIndent: 8.0,
          ),
        ],
      ),
      items: [
        for (int i = 0; i < sideBarItems.length; i++)
          SideMenuItem(
            builder: (context, displayMode) => CustomSideMenuItem(
              index: i,
              title: sideBarItems.keys.toList()[i],
              topGap: i == 0 ? 34 : 0,
              buttonGap:
                  sideBarItems.keys.toList()[i] == "Customize Fees" ? 100 : 0,
              iconWidget: sideBarItems.values.toList()[i],
              isDesktop: isDesktop,
              isSelected: currentTab.value == i,
              onTap: (index) {
                handleClick(index);
                sideMenu.changePage(index);
                currentTab.value = i;
              },
            ),
          ),
        if (isDesktop)
          SideMenuItem(
            builder: (context, displayMode) {
              return const CustomBanner();
            },
          ),
        SideMenuItem(
          builder: (context, displayMode) {
            return UserItem(isDesktop: isDesktop);
          },
        )
      ],
    );
  }
}
