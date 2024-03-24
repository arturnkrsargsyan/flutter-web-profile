import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loan_xtimate/constans/app_colors.dart';
import 'package:loan_xtimate/main.dart';
import 'package:loan_xtimate/screens/tabs/widgets/user_field_item.dart';
import 'package:loan_xtimate/widgets/tab_appbar.dart';

class UserCredentials extends ConsumerWidget {
  const UserCredentials({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);

    return Column(
      children: [
        const TabAppBar(
          title: "Credentials",
          subtitle:
              "You may edit your password, but please contact support if you need to update your username",
        ),
        UserFieldItem(
          "Username",
          _userProvider.userData.email,
          onTopBorder: true,
          _userProvider.isEditModeActive,
          textInputColor: AppColors.greyTextColor,
        ),
        UserFieldItem(
          topGap: _userProvider.isEditModeActive,
          _userProvider.isEditModeActive ? "New password" : "Password",
          _userProvider.userData.password,
          _userProvider.isEditModeActive,
          onButtomBorder: true,
          onTopBorder: _userProvider.isEditModeActive,
          obscureText: true,
          textInputSubtitle:
              "Your new password must be more than 8 characters.",
        ),
        if (_userProvider.isEditModeActive)
          UserFieldItem(
            "Confirm new password",
            _userProvider.userData.password,
            _userProvider.isEditModeActive,
            onButtomBorder: true,
            obscureText: true,
          ),
      ],
    );
  }
}
