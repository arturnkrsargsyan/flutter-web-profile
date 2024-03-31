import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loanxtimate/consts/app_colors.dart';
import 'package:loanxtimate/main.dart';
import 'package:loanxtimate/settings/tabs/widgets/tab_appbar.dart';
import 'package:loanxtimate/settings/tabs/widgets/user_field_item.dart';

class UserCredentials extends ConsumerWidget {
  const UserCredentials({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);
    final _pageProvider = ref.watch(pageProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          buttomGap: _pageProvider.isEditModeActive,
          _pageProvider.isEditModeActive,
          textInputColor: AppColors.greyTextInput,
        ),
        UserFieldItem(
          _pageProvider.isEditModeActive ? "New password" : "Password",
          _userProvider.userData.password,
          _pageProvider.isEditModeActive,
          onButtomBorder: true,
          onTopBorder: _pageProvider.isEditModeActive,
          obscureText: true,
          textInputSubtitle:
              "Your new password must be more than 8 characters.",
          textInputColor: AppColors.greyTextInput,
        ),
        if (_pageProvider.isEditModeActive)
          UserFieldItem(
            "password",
            _userProvider.userData.password,
            _pageProvider.isEditModeActive,
            onButtomBorder: true,
            obscureText: true,
            textInputColor: AppColors.greyTextInput,
          ),
      ],
    );
  }
}
