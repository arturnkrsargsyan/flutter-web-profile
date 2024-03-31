import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loanxtimate/consts/app_colors.dart';
import 'package:loanxtimate/main.dart';
import 'package:loanxtimate/models/user_data.dart';
import 'package:loanxtimate/settings/tabs/widgets/custom_divider.dart';

class AddressFieldItem extends HookConsumerWidget {
  final String fieldName;
  final String fieldValue;
  final bool editMode;

  const AddressFieldItem({
    required this.fieldName,
    required this.fieldValue,
    required this.editMode,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final _form = GlobalKey<FormState>();
    final _userProvider = ref.watch(userProvider);
    final _pageProvider = ref.watch(pageProvider);

    final streetController = useTextEditingController.fromValue(
        TextEditingValue(text: _userProvider.userData.streetNumberAndName));

    final suiteController = useTextEditingController
        .fromValue(TextEditingValue(text: _userProvider.userData.suit));
    final cityController = useTextEditingController
        .fromValue(TextEditingValue(text: _userProvider.userData.city));

    final zipController = useTextEditingController.fromValue(
        TextEditingValue(text: _userProvider.userData.zipCode.toString()));

    final selectedState = useState<String>(_userProvider.userData.state);

    List<DropdownMenuItem<String>> dropdownItems =
        stateAbbreviations.values.map((abbreviation) {
      return DropdownMenuItem<String>(
        value: abbreviation,
        child: Text(abbreviation),
      );
    }).toList();

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
      if (constrains.maxWidth <= 530) {
        _pageProvider.isMinHeight = true;
      } else {
        _pageProvider.isMinHeight = false;
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomDivider(),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: fieldNameWidth.value,
                // width: 280,
                child: Text(
                  fieldName,
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              const SizedBox(width: 32),
              if (editMode)
                SizedBox(
                  width: textFieldWidthState.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: streetController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.blue,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: suiteController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.blue,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        // Used Row to display city, state, and zipCode horizontally
                        children: [
                          Expanded(
                            child: TextField(
                              controller: cityController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: AppColors.blue,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 12.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: _pageProvider.isMinHeight ? 8 : 28,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: _pageProvider.isMinHeight ? 4 : 14),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: DropdownButton<String>(
                              underline: Container(),
                              value: selectedState.value,
                              items: dropdownItems,
                              onChanged: (String? value) {
                                if (value != null) {
                                  selectedState.value = value;
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: _pageProvider.isMinHeight ? 8 : 28,
                          ),
                          Expanded(
                            child: TextField(
                              controller: zipController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: AppColors.blue,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 12.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              else
                SizedBox(
                  height: 120,
                  child: Text(
                    fieldValue,
                    style: const TextStyle(
                      fontSize: 18,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      );
    });
  }
}
