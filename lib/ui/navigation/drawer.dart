import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:loanxtimate/consts/app_colors.dart';
import 'package:loanxtimate/gen/assets.gen.dart';
import 'package:loanxtimate/ui/navigation/custom_side_menu.dart';
import 'package:loanxtimate/ui/navigation/widgets/app_name_item.dart';
import 'package:loanxtimate/ui/navigation/widgets/custom_banner.dart';
import 'package:loanxtimate/ui/navigation/widgets/drawer_item.dart';
import 'package:loanxtimate/ui/navigation/widgets/user_item.dart';


class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.pageController,
    required this.sideMenu,
  });

  final SideMenuController sideMenu;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.white2,
            ),
            child: Row(
              children: [
                Image.asset(
                  width: 38,
                  height: 38,
                  Assets.images.logomark32h.path,
                  fit: BoxFit.cover,
                ),
                const AppNameItem(
                  name: 'LoanXtimate',
                )
              ],
            ),
          ),
          for (int i = 0; i < sideBarItems.length; i++)
            DrawerItem(
              index: i == 4 ? 5 : i,
              pageController: pageController,
              leading: sideBarItems.values.toList()[i],
              title: sideBarItems.keys.toList()[i],
            ),
          const CustomBanner(
            width: 200,
            margin: 24,
          ),
          const UserItem(),
        ],
      ),
    );
  }
}
