import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loanxtimate/consts/app_colors.dart';
import 'package:loanxtimate/gen/assets.gen.dart';
import 'package:loanxtimate/settings/tabs/widgets/custom_divider.dart';

class UserFieldItemWithImage extends HookConsumerWidget {
  final String fieldName;
  final String imagePath;
  final bool isCircle;
  final bool isEditMode;
  const UserFieldItemWithImage({
    Key? key,
    required this.fieldName,
    required this.imagePath,
    required this.isEditMode,
    this.isCircle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= rowWidthState.value + 100) {
        Future.delayed(
          Duration.zero,
          decreasing,
        );
      } else if (gapCountState.value > 0 &&
          (constraints.maxWidth > rowWidthState.value + 200)) {
        Future.delayed(Duration.zero, increasing);
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomDivider(),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                width: fieldNameWidth.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          fieldName,
                          style: const TextStyle(
                            color: AppColors.grey,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.3,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.network(
                          Assets.icons.required.path,
                          width: 15,
                          height: 15,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text("This will be displayed on your profile"),
                  ],
                ),
              ),
              const SizedBox(width: 32),
              SizedBox(
                width: textFieldWidthState.value,
                // width: 512,
                child: Row(
                  children: [
                    if (isCircle)
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          imagePath,
                        ),
                        radius: 32,
                      )
                    else
                      Image.asset(
                        fit: BoxFit.cover,
                        width: textFieldWidthState.value / 2 - 30,
                        height: 62,
                        imagePath,
                      ),
                    const Spacer(),
                    if (isEditMode)
                      const InkWell(
                        child: Text(
                          "Delete",
                          style: TextStyle(
                            color: Color.fromRGBO(71, 84, 103, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    const SizedBox(
                      width: 16,
                    ),
                    if (isEditMode)
                      const InkWell(
                        child: Text(
                          "Update",
                          style: TextStyle(
                            color: Color.fromRGBO(105, 65, 198, 1.0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          if (isCircle)
            const SizedBox(
              height: 20,
            ),
        ],
      );
    });
  }
}
