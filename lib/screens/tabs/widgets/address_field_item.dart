import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loan_xtimate/constans/app_colors.dart';
import 'package:loan_xtimate/main.dart';
import 'package:loan_xtimate/models/user_data.dart';

class AddressFieldItem extends HookConsumerWidget {
  final String fieldName;
  final String fieldValue;

  const AddressFieldItem(
    this.fieldName,
    this.fieldValue, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final _form = GlobalKey<FormState>();
    final _userProvider = ref.watch(userProvider);

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

    return Column(
      // crossAxisAlignment: CrossAxisAlignment.end,
      // mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          thickness: 1,
          color: AppColors.dividerColor,
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 280,
              child: Text(
                fieldName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 32),
            if (_userProvider.isEditModeActive)
              SizedBox(
                width: 512,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: streetController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.blue,
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
                            color: Colors.blue,
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
                      // Use Row to display city, state, and zipCode horizontally
                      children: [
                        Expanded(
                          child: TextField(
                            controller: cityController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.blue,
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
                        const SizedBox(
                          width: 28,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
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
                        const SizedBox(
                          width: 28,
                        ),
                        Expanded(
                          child: TextField(
                            controller: zipController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.blue,
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
              Text(
                fieldValue,
                style: const TextStyle(fontSize: 18),
              ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
