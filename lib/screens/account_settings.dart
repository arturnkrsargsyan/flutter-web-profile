import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loan_xtimate/main.dart';
import 'package:loan_xtimate/screens/tabs/user_credentials.dart';
import 'package:loan_xtimate/screens/tabs/user_profile.dart';
import 'package:loan_xtimate/widgets/tab_item.dart';

class AccountSettingsScreen extends HookConsumerWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);
    final selectedIndexState = useState<int>(0);

    final List<String> tabs = [
      "My Profile",
      "Credentials",
      "Account Plans",
      "Billing",
      "Integrations"
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Account Settings',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(234, 236, 240, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  height: 48,
                  child: ListView.separated(
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final currentTab = tabs[index];
                      final currentTabIndex = tabs.indexOf(currentTab);
                      return GestureDetector(
                        onTap: () {
                          _userProvider.isEditModeActive = false;
                          selectedIndexState.value = currentTabIndex;
                        },
                        child: TabItem(
                          tabName: tabs[index],
                          isSelected:
                              selectedIndexState.value == currentTabIndex,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 4),
                    itemCount: tabs.length,
                  ),
                ),
              ),
              Expanded(
                child: IndexedStack(
                  index: selectedIndexState.value,
                  children: const [
                    UserProfile(),
                    UserCredentials(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
