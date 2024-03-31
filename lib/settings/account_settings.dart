import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:loanxtimate/consts/app_colors.dart';
import 'package:loanxtimate/consts/app_padding.dart';
import 'package:loanxtimate/settings/tabs/user_credentials.dart';
import 'package:loanxtimate/settings/tabs/user_profile.dart';
import 'package:loanxtimate/settings/tabs/widgets/tab_item.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AccountSettingsScreen extends HookWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndexState = useState<int>(0);
    final breakpoint = ResponsiveBreakpoints.of(context).breakpoint;

    final verticalScrollController = useScrollController();

    final width = MediaQuery.of(context).size.width;

    final List<String> tabs = [
      "My Profile",
      "Credentials",
      "Account Plans",
      "Billing",
      "Integrations"
    ];
    void handleClick(int index) {
      switch (index) {
        case 0:
          context.go("/account/my-profile");
          break;
        case 1:
          context.go("/account/credentials");
          break;
        case 2:
          context.go("/account/account-plans");
          break;
        case 3:
          context.go("/account/billing");
          break;
        case 4:
          context.go("/account/integrations");

          break;
      }
    }

    return LayoutBuilder(builder: (context, constrains) {
      return Scrollbar(
        thumbVisibility: true,
        thickness: 3,
        trackVisibility: false,
        controller: verticalScrollController,
        child: SingleChildScrollView(
          controller: verticalScrollController,
          child: Container(
            padding: const EdgeInsets.all(32.0),
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Account Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.borderColor,
                    ),
                    color: AppColors.white2,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: breakpoint.name == DESKTOP
                      ? width - AppPadding.openSideMenuSize
                      : width,
                  height: 44,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tabs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          handleClick(index);
                          selectedIndexState.value = index;
                        },
                        child: TabItem(
                          tabName: tabs[index],
                          isSelected: selectedIndexState.value == index,
                        ),
                      );
                    },
                  ),
                ),
                IndexedStack(
                  index: selectedIndexState.value,
                  children: [
                    const UserProfile(),
                    const UserCredentials(),
                    Center(
                      child: Text(tabs[selectedIndexState.value]),
                    ),
                    Center(
                      child: Text(tabs[selectedIndexState.value]),
                    ),
                    Center(
                      child: Text(tabs[selectedIndexState.value]),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
