import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loanxtimate/main.dart';
import 'package:loanxtimate/settings/tabs/widgets/address_field_item.dart';
import 'package:loanxtimate/settings/tabs/widgets/tab_appbar.dart';
import 'package:loanxtimate/settings/tabs/widgets/user_field_item.dart';
import 'package:loanxtimate/settings/tabs/widgets/user_field_item_image.dart';

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

class UserProfile extends ConsumerWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);
    final _pageProvider = ref.watch(pageProvider);

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
    final fieldsKeys = fields.keys.toList();
    final fieldsValues = fields.values.toList();

    Widget buildField(index) {
      if (fieldsKeys[index] == shownUserFields[UserField.profilePicture] ||
          fieldsKeys[index] ==
              shownUserFields[UserField.customSignatureImagePath]) {
        return UserFieldItemWithImage(
          fieldName: fieldsKeys[index],
          imagePath: fieldsValues[index],
          isCircle:
              fieldsKeys[index] == shownUserFields[UserField.profilePicture],
          isEditMode: _pageProvider.isEditModeActive,
        );
      } else if (fieldsKeys[index] ==
          shownUserFields[UserField.officeAddress]) {
        return AddressFieldItem(
          fieldName: fieldsKeys[index],
          fieldValue: fieldsValues[index],
          editMode: _pageProvider.isEditModeActive,
        );
      } else {
        return UserFieldItem(
          fieldsKeys[index],
          fieldsValues[index],
          _pageProvider.isEditModeActive,
          onTopBorder: true,
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TabAppBar(
          title: "My Profile",
          subtitle: "Update your personal data here.",
        ),
        for (int i = 0; i < fields.length; i++) buildField(i)
      ],
    );
  }
}
