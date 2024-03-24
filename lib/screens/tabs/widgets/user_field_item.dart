import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loan_xtimate/constans/app_colors.dart';
import 'package:loan_xtimate/main.dart';
import 'package:loan_xtimate/screens/tabs/user_profile.dart';

class UserFieldItem extends HookConsumerWidget {
  const UserFieldItem(this.fieldName, this.fieldValue, this.editMode,
      {this.textInputColor = Colors.black,
      this.dividerColor = AppColors.dividerColor,
      this.obscureText = false,
      this.buttomGap = true,
      this.topGap = true,
      this.heightToBorder = 0,
      this.onTopBorder,
      this.onButtomBorder,
      this.textInputSubtitle,
      Key? key})
      : super(key: key);

  final bool? onTopBorder;
  final Color textInputColor;
  final Color dividerColor;
  final bool? onButtomBorder;
  final String fieldName;
  final String fieldValue;
  final bool editMode;
  final String? textInputSubtitle;
  final double heightToBorder;
  final bool obscureText;
  final bool topGap;
  final bool buttomGap;

  String hideString(String data) {
    String hiddenData = "";
    for (var i = 0; i < data.length; i++) {
      hiddenData += "•";
    }
    return hiddenData;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);

    bool isNameField = fieldName == shownUserFields[UserField.name];
    bool isPhoneField = fieldName == shownUserFields[UserField.phone];

    final field1Controller = useTextEditingController.fromValue(
      TextEditingValue(
          text: isNameField ? _userProvider.userData.firstName : fieldValue),
    );

    final field2Controller = useTextEditingController.fromValue(
      TextEditingValue(
          text: isNameField ? _userProvider.userData.lastName : fieldValue),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (onTopBorder != null && onTopBorder == true)
          SizedBox(
            height: heightToBorder,
            child: Divider(
              thickness: 1,
              color: dividerColor,
            ),
          ),
        Visibility(
          visible: topGap,
          child: const SizedBox(height: 20),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 280,
              child: Text(
                fieldName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 32),
            Visibility(
              visible: editMode,
              child: SizedBox(
                width: isNameField ? 244 : 512,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      obscureText: obscureText,
                      style: TextStyle(
                        color: textInputColor,
                      ),
                      controller: field1Controller,
                      decoration: InputDecoration(
                        prefixIcon: isPhoneField
                            ? const Icon(Icons.phone_outlined)
                            : null,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                      ),
                    ),
                    if (textInputSubtitle != null && editMode)
                      const SizedBox(
                        height: 6,
                      ),
                    if (textInputSubtitle != null && editMode)
                      Text(
                        textInputSubtitle!,
                        style: const TextStyle(
                          color: AppColors.subTitleColor,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            if (editMode && isNameField)
              const SizedBox(
                width: 24,
              ),
            Visibility(
              visible: editMode && isNameField,
              child: SizedBox(
                width: 244,
                child: TextField(
                  controller: field2Controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !editMode,
              child: Text(
                obscureText ? hideString(fieldValue) : fieldValue,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        Visibility(
          visible: buttomGap,
          child: const SizedBox(height: 20),
        ),
        if (!editMode && textInputSubtitle != null)
          const SizedBox(
            height: 20,
          ),
        if (onButtomBorder != null && onButtomBorder == true)
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: heightToBorder,
            child: Divider(
              thickness: 1,
              color: dividerColor,
            ),
          ),
      ],
    );
  }
}
