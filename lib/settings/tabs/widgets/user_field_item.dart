import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loanxtimate/consts/app_colors.dart';
import 'package:loanxtimate/main.dart';
import 'package:loanxtimate/settings/tabs/user_profile.dart';
import 'package:loanxtimate/settings/tabs/widgets/custom_divider.dart';

class UserFieldItem extends HookConsumerWidget {
  const UserFieldItem(this.fieldName, this.fieldValue, this.editMode,
      {this.textInputColor = Colors.black,
      this.dividerColor = AppColors.borderColor,
      this.obscureText = false,
      this.buttomGap = true,
      this.topGap = true,
      this.onTopBorder = false,
      this.onButtomBorder = false,
      this.textInputSubtitle,
      Key? key})
      : super(key: key);

  final Color dividerColor;
  final Color textInputColor;
  final bool onButtomBorder;
  final bool onTopBorder;
  final bool editMode;
  final bool obscureText;
  final bool topGap;
  final bool buttomGap;
  final String fieldName;
  final String fieldValue;
  final String? textInputSubtitle;

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

    final fieldNameWidth = useState<double>(280);
    const initialRowWidth = 825;
    final rowWidthState = useState<int>(initialRowWidth);
    final gapCountState = useState<int>(0);
    final textFieldWidthState = useState<double>(512);

    void decreasing() {
      rowWidthState.value -= 100;
      if (textFieldWidthState.value > 212) {
        textFieldWidthState.value -= 100;
      }
      fieldNameWidth.value -= 25;
      gapCountState.value++;
    }

    void increasing() {
      if (rowWidthState.value < initialRowWidth) {
        rowWidthState.value += 100;
      }
      if (textFieldWidthState.value < 512) {
        textFieldWidthState.value += 100;
      }
      fieldNameWidth.value += 25;

      gapCountState.value--;
    }

    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth <= rowWidthState.value + 80) {
        Future.delayed(
          Duration.zero,
          decreasing,
        );
      } else if (gapCountState.value > 0 &&
          (constrains.maxWidth > rowWidthState.value + 200)) {
        Future.delayed(Duration.zero, increasing);
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: onTopBorder,
            child: const CustomDivider(),
          ),
          Visibility(
            visible: topGap,
            child: const SizedBox(height: 20),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: fieldNameWidth.value,
                child: Text(
                  fieldName,
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
              const SizedBox(width: 32),
              Visibility(
                visible: editMode,
                child: SizedBox(
                  width: isNameField
                      ? textFieldWidthState.value / 2 - 12
                      : textFieldWidthState.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        obscureText: obscureText,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: textInputColor,
                        ),
                        controller: field1Controller,
                        decoration: InputDecoration(
                          prefixIcon: isPhoneField
                              ? const Icon(Icons.phone_outlined)
                              : null,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.blue,
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
                            color: AppColors.subTitle,
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
                  width: textFieldWidthState.value / 2 - 12,
                  child: TextField(
                    controller: field2Controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.blue,
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
                child: SizedBox(
                  height: 45,
                  child: Text(
                    obscureText ? hideString(fieldValue) : fieldValue,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.textColor,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: buttomGap,
            child: const SizedBox(height: 20),
          ),
          Visibility(
            visible: onButtomBorder,
            child: const CustomDivider(),
          ),
        ],
      );
    });
  }
}
