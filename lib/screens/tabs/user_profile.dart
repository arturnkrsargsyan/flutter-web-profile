import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loan_xtimate/constans/app_colors.dart';
import 'package:loan_xtimate/main.dart';
import 'package:loan_xtimate/screens/tabs/widgets/address_field_item.dart';
import 'package:loan_xtimate/screens/tabs/widgets/user_field_item.dart';
import 'package:loan_xtimate/screens/tabs/widgets/user_field_item_image.dart';
import 'package:loan_xtimate/widgets/tab_appbar.dart';

enum UserField {
  name,
  lastName,
  emailAddress,
  profilePicture,
  title,
  nmlsId,
  phone,
  officeAddress,
  customSignatureImagePath;
}

final Map<UserField, String> shownUserFields = {
  UserField.name: "Name",
  UserField.emailAddress: "Email address",
  UserField.profilePicture: "Profile Picture",
  UserField.title: "Title",
  UserField.nmlsId: "NMLS ID",
  UserField.phone: "Phone",
  UserField.officeAddress: "Office Address",
  UserField.customSignatureImagePath: "Custom Signature"
};

class UserProfile extends HookConsumerWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);
    final userData = _userProvider.userData;

    final Map<String, String> fields = {
      shownUserFields[UserField.name]!:
          "${userData.firstName} ${userData.lastName}",
      shownUserFields[UserField.emailAddress]!: userData.email,
      shownUserFields[UserField.profilePicture]!: userData.imagePath,
      shownUserFields[UserField.title]!: userData.title,
      shownUserFields[UserField.nmlsId]!: userData.nmls.toString(),
      shownUserFields[UserField.phone]!: userData.phone,
      shownUserFields[UserField.officeAddress]!: userData.getFormattedAddres(),
      shownUserFields[UserField.customSignatureImagePath]!:
          userData.customSignatureImagePath
    };
    return Column(
      children: [
        const TabAppBar(
          title: "My Profile",
          subtitle: "Update your personal data here.",
        ),
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: Expanded(
            child: ListView.builder(
              itemCount: fields.length,
              itemBuilder: (context, index) {
                final fieldsKeys = fields.keys.toList();
                final fieldsValues = fields.values.toList();
                if (fieldsKeys[index] ==
                        shownUserFields[UserField.profilePicture] ||
                    fieldsKeys[index] ==
                        shownUserFields[UserField.customSignatureImagePath]) {
                  return UserFieldItemWithImage(
                    fieldName: fieldsKeys[index],
                    imagePath: fieldsValues[index],
                    isCircle: fieldsKeys[index] ==
                            shownUserFields[UserField.customSignatureImagePath]
                        ? false
                        : true,
                  );
                } else if (fieldsKeys[index] ==
                    shownUserFields[UserField.officeAddress]) {
                  return AddressFieldItem(
                      fieldsKeys[index], fieldsValues[index]);
                } else {
                  return UserFieldItem(
                    fieldsKeys[index],
                    fieldsValues[index],
                    _userProvider.isEditModeActive ? true : false,
                    onTopBorder: true,
                    textInputColor: fieldsKeys[index] ==
                            shownUserFields[UserField.emailAddress]
                        ? AppColors.greyTextColor
                        : AppColors.textColor,
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
